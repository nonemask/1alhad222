class CreateHekoms < ActiveRecord::Migration
  def change
    create_table :hekoms do |t|
      t.string :name

      t.timestamps
    end
  end
end
