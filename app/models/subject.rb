class Subject < ActiveRecord::Base
  belongs_to :collection
  has_many :annotations
  has_many :consensuses

  scope :active,                  -> {where(state: "active")}
  scope :complete,                -> {where(state: "complete")}
  scope :complete_with_consensus, -> {where(state: "complete_with_consensus")}
  scope :random,                  lambda {|count| order("RANDOM()").limit(count)}

  def collect_annotations
    annotations.inject({}) do |r,a|
      if a.fields.values.first.length>0
        r[a.name] ||= [];
        r[a.name].push({user_id: a.user_id, fields: a.fields})
      end
      r
    end
  end
end
