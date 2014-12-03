require './lib/Ouroboros'

desc "import data form mongo"
task :import_all => [:import_collections,:import_subjects,  :import_annotations]

task :import_collections => :environment do
  Ouroboros["notes_from_nature_groups"].find(type: "archive").each do |g|
    Collection.find_or_create_by(external_id: g["_id"].to_s ) do |collection|
      collection.name           = g["name"]
      collection.image          = g["metadata"]["location"]["image"]
      collection.description    = g["metadata"]["description"]
      collection.regions        = g["metadata"]["regions"]
      collection.external_id    = g["_id"].to_s
      collection.url            = "http://www.notesfromnature.org/#/archives/#{g["name"]}"
    end
  end

end

task :import_annotations => :environment do

  Ouroboors["notes_from_nature_classifications"].each do |s|
    Subject.find_or_create_by(external_id: s["_id"].to_s ) do |subject|
      subject.image_url             = s["location"]["standard"]
      subject.classification_count  = s["classification_count"]
      subject.state                 = s["state"]
      subject.external_id           = s["_id"]
      subject.metadata              = s["metadata"]
      collection = Group.find_by_external_id(s["group_id"].to_s)
      subject.collection            = collection
    end
  end

end

task :import_subjects => :environment do

  total = Ouroboros["notes_from_nature_subjects"].count
  Ouroboros["notes_from_nature_subjects"].find.each_with_index do |s,index|

    puts "done #{index} of #{total}" if index%1000 == 0

    Subject.find_or_create_by(external_id: s["_id"].to_s ) do |subject|
      subject.image_url             = s["location"]["standard"]
      subject.classification_count  = s["classification_count"]
      subject.state                 = s["state"]
      subject.external_id           = s["_id"].to_s
      subject.metadata              = s["metadata"]
      collection = Collection.find_by_external_id(s["group_id"].to_s)
      subject.collection            = collection
    end
  end


end

task :trash_all_data => :environment do
  Collection.destroy_all
  Subject.destroy_all
  Annotation.destroy_all
end
