class AddAttachmentMusicToAset < ActiveRecord::Migration
  def self.up
    add_column :asets, :music_file_name, :string
    add_column :asets, :music_content_type, :string
    add_column :asets, :music_file_size, :integer
    add_column :asets, :music_updated_at, :datetime
  end

  def self.down
    remove_column :asets, :music_file_name
    remove_column :asets, :music_content_type
    remove_column :asets, :music_file_size
    remove_column :asets, :music_updated_at
  end
end
