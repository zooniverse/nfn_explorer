class Subject < ActiveRecord::Base
  belongs_to :collection
  has_many :annotations
  has_many :consensuses

  scope :active,                  -> {where(state: "active")}
  scope :complete,                -> {where(state: "complete")}
  scope :complete_with_consensus, -> {where(state: "complete_with_consensus")}
  scope :random,                  lambda {|count| order("RANDOM()").limit(count)}

  def collect_annotations
    annotations.inject({}){|r,a| r[a.name] ||= []; r[a.name]= {user_id: a.user_id, fields: a.fields} ; r}
  end
end
