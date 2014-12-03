class Subject < ActiveRecord::Base
  belongs_to :collection
  has_many :annotations
  has_many :consensuses

  scope :active,                  -> {where(state: "active")}
  scope :complete,                -> {where(state: "complete")}
  scope :complete_with_consensus, -> {where(state: "complete_with_consensus")}

end
