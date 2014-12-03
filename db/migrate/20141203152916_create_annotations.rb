class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.string  :name
      t.string  :external_id
      t.hstore  :fields
      t.string  :user_id
      t.integer :subject_id

      t.timestamps
    end

    add_index :annotations, :subject_id
    add_index :annotations, :user_id
    add_index :annotations, :name
    add_index :annotations, :external_id
  end
end
