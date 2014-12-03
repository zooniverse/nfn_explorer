class Consensus < ActiveRecord::Base
  belongs_to :subject
  has_many :annotations
end
