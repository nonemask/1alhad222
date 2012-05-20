class CreateStudionames < ActiveRecord::Migration
  def change
    create_table :studionames do |t|
      t.string :name

      t.timestamps
    end
  end
end
