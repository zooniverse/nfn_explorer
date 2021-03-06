class Subject < ActiveRecord::Base
  belongs_to :collection
  has_many :annotations
  has_many :consensuses

  scope :active,                  -> {where(state: "active")}
  scope :complete,                -> {where(state: "complete")}
  scope :complete_with_consensus, -> {where(state: "complete_with_consensus")}
  scope :random,                  lambda {|count| order("RANDOM()").limit(count)}
  scope :field_like,              lambda {|field, like| where("fields->? ILIKE ?",field,"%#{like}%" )}
  scope :any_field,               lambda {|query| where("array_to_string(avals(fields), ',') ILIKE ? ", "%#{query}%")}

  def collect_annotations
    annotations.inject({}) do |r,a|
      if a.fields.values.first.length>0
        r[a.name] ||= [];
        r[a.name].push({user_id: a.user_id, fields: a.fields})
      end
      r
    end
  end

  def most_common_for_field(field)
    ranks =collect_annotations[field].inject({}){|r,a| r[a[:fields].values.first] ||=0;  r[a[:fields].values.first]+=1; r }
    ranks.sort{|a| a[1]}.last
  end

  def search (query)
    if query.include? ":"
      pairs = query.split(",").collect{|q| q.split(":")}
    else
      result = any_field(query)
    end
    result
  end
end
