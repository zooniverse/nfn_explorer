class CollectionSerializer < ActiveModel::Serializer
  attributes :id, :stats , :name, :image, :description, :regions, :external_id

end
