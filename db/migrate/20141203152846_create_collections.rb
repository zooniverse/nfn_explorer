class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.string :name
      t.string :image
      t.text   :description
      t.string :regions , array: true
      t.string :external_id
      t.string :url
      t.timestamps
    end

    add_index :collections, :external_id
  end
end
