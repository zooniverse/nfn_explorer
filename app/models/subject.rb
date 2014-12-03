class Subject < ActiveRecord::Base
  has_many: annotations
  has_many: consensuses
end
