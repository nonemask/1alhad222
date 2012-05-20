class CreateAsets < ActiveRecord::Migration
  def change
    create_table :asets do |t|
      t.references :sound

      t.timestamps
    end
    add_index :asets, :sound_id
  end
end
