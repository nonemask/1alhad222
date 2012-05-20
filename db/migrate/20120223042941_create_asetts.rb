class CreateAsetts < ActiveRecord::Migration
  def change
    create_table :asetts do |t|
      t.references :list

      t.timestamps
    end
    add_index :asetts, :list_id
  end
end
