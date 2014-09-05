class CreateLobbies < ActiveRecord::Migration
  def change
    create_table :lobbies do |t|
      t.string :list

      t.timestamps
    end
  end
end
