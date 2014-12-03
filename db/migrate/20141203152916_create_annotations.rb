class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.string :type
      t.string :external_id
      t.hstore :fields
      t.timestamps
    end
  end
end
