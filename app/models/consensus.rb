class Consensus < ActiveRecord::Base
  belongs_to: subject
  had_many: annotations
end
