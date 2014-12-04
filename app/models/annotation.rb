class Annotation < ActiveRecord::Base
  belongs_to :subject
  belongs_to :consensus

  def self.search(search_params)
    query = where()
    search_params.each_pair do |key, value|
      query = query.where("lower(fields->'?') LIKE %?%", key.downcase, value)
    end
    query.all()
  end
end
