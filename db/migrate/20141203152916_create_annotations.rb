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
  end
end
