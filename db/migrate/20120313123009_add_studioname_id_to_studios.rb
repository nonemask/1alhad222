class AddStudionameIdToStudios < ActiveRecord::Migration
  def change
    add_column :studios, :studioname_id, :string

  end
end
