# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

c = Collection.create({
    name: "Herbarium",
    image: "http://static.zooniverse.org/www.notesfromnature.org/images/img-collections3.jpg",
    description: "The SERNEC collection is comprised of herbarium specimens: these flowers and plants are carefully pressed onto sheets along with descriptive labels, and contain vital information for broader understanding of biodiversity at regional and national scales.",
    regions: ["here", "there"],
    external_id: "5170103b3ae74027cf000002",
    url: "http://www.notesfromnature.org/#/archives/herbarium"
})

s1 = Subject.create({
  image_url: "http://www.notesfromnature.org/subjects/sernec/valdosta/52e03118918ac8983d60a361.jpg",
  classification_count: 2,
  state: "active",
  external_id: "52e03118918ac8983d60a361",
  metadata: {metadata_key1:1, metadata_key2: "two"},
  collection: c
})


s2 = Subject.create({
  image_url: "http://www.notesfromnature.org/subjects/sernec/valdosta/52e0379a918ac8983d60ab38.jpg",
  classification_count: 2,
  state: "active",
  external_id: "52e0379a918ac8983d60ab38",
  metadata: {metadata_key1:1, metadata_key2: "two"},
  collection: c
})


Annotation.create({
  subject: s1,
  name: "State",
  fields: {value: "CO"},
  user_id:1
})

Annotation.create({
  subject: s2,
  name: "Collected by",
  fields: {value: "R. K. Godfrey"},
  user_id: 1
})

Annotation.create({
  subject: s2,
  name: "State",
  fields: {value: "CO"},
  user_id:1
  })

Annotation.create({
  subject: s2,
  name: "Collected by",
  fields: {value: "R. Godfrey"},
  user_id: 3
})
