class CreatePotrebitels < ActiveRecord::Migration
  def change
    create_table :potrebitels do |t|
      t.string :login
      t.string :password
      t.string :email
      t.integer :win
      t.integer :lost
      t.integer :success_cat_id
      t.integer :failure_cat_id
      t.string :time_online
      t.integer :reiting_pos

      t.timestamps
    end
  end
end
