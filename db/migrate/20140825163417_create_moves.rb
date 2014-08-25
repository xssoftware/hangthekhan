class CreateMoves < ActiveRecord::Migration
  def change
    create_table :moves do |t|
      t.string :char
      t.references :game, index: true

      t.timestamps
    end
  end
end
