class CreateStatistics < ActiveRecord::Migration
  def change
    create_table :statistics do |t|
      t.string :user
      t.integer :gameswon

      t.timestamps
    end
  end
end
