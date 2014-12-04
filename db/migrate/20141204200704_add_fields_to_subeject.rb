class AddFieldsToSubeject < ActiveRecord::Migration
  def change
    add_column :subjects, :fields, :hstore
  end
end
