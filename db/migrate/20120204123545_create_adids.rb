class CreateAdids < ActiveRecord::Migration
  def change
    create_table :adids do |t|
      t.integer :role_id
      t.integer :user_id

      t.timestamps
    end
    add_index :adids,:role_id
    add_index :adids,:user_id
  end
end
