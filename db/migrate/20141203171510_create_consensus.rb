class CreateConsensus < ActiveRecord::Migration
  def change
    create_table :consensus do |t|

      t.timestamps
    end
  end
end
