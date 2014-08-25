class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.references :user1, index: true
      t.references :user2, index: true
      t.integer :status
      t.references :word, index: true

      t.timestamps
    end
  end
end
