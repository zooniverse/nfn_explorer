class AddStateIndexToSubject < ActiveRecord::Migration
  def change
    add_index :subjects, :state
  end
end
