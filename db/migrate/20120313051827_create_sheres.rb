class CreateSheres < ActiveRecord::Migration
  def change
    create_table :sheres do |t|
      t.references :studio

      t.timestamps
    end
    add_index :sheres, :studio_id
  end
end
