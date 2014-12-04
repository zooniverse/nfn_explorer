class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :classification_count, :state, :external_id, :metadata, :collection_id, :created_at, :updated_at, :annotations, :collection
  has_many :annotations
  has_one  :collection
end
