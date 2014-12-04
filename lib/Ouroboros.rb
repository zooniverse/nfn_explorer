require 'mongo'

if Rails.env =='development'
  config = YAML.load_file("#{Rails.root.to_s}/config/ouroboros.yml")[Rails.env]
  client = Mongo::MongoClient.new(config["host"], config["port"])

  Ouroboros     = client[config["db"]]
end 
