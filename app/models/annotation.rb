class Annotation < ActiveRecord::Base
  belongs_to :subject
  belongs_to :consensus
end
