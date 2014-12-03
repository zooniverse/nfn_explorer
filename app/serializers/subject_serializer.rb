class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :image_url, :classification_count, :state, :external_id, :metadata, :collection_id, :created_at, :updated_at
  has_many :annotations
  belongs_to :collection , only: [:name, :id, :image]

end
