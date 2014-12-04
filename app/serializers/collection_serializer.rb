class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :stats , :name, :image, :description, :regions, :external_id, :sample_subjects

  def sample_subjects
    object.subjects.random(10)
  end
  
end
