class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.string  :image_url
      t.integer :classification_count
      t.string  :state, :in => ["active", "complete", "complete_with_consensus"]
      t.string  :external_id
      t.hstore  :metadata
      t.integer :collection_id



      t.timestamps
    end
    add_index :subjects, :external_id
    add_index :subjects, :collection_id
  end
end
