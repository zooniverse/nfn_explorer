class Subject < ActiveRecord::Base
  belongs_to :collection
  has_many :annotations
  has_many :consensuses
end
