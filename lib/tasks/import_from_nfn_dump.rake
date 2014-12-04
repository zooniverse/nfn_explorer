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

  total = Ouroboros["notes_from_nature_classifications"].count

  Ouroboros["notes_from_nature_classifications"].find().each_with_index do |classification, count|

    puts "done #{count} of #{total}" if count%1000 == 0

    user_id = (classification["user_id"] || classification["user_ip"]).to_s
    anns = classification["annotations"].select{|a| a.keys.include? "step"}.collect{|a| [ a["step"], a["value"] ] }

    anns.each_with_index do |ann,index|
      external_id = classification["_id"].to_s+"_#{index}"

      subject = Subject.find_by_external_id(classification["subject_ids"].first.to_s)

      Annotation.find_or_create_by(external_id: external_id ) do |annotation|
        annotation.name                  = ann[0]
        annotation.fields                = {ann[0] => ann[1]}
        annotation.subject_id            = subject.id
        annotation.user_id               = user_id
      end
    end
  end
end

task :generate_common_tags => :environment do
  Collection.each do |collection|

    collection.subjects.each do |subject|
      anns = subject.collect_annotations
    end
  end

end

task :import_subjects => :environment do

  total = Ouroboros["notes_from_nature_annotation"].count
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

task :generate_key_lists  => :environment do
  total = Subject.count
  Subject.all.each_with_index do |s,index|
    puts "done #{index} of #{total}"
    anns = s.collect_annotations
    fields = anns.keys.inject({}){|r,a| r[a] = s.most_common_for_field(a)[0]; r }
    s.fields =fields
    s.save!
  end
end
