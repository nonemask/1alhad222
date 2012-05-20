class CreateFeeds < ActiveRecord::Migration
  def change
    create_table :feeds do |t|
      t.integer :user_id
      t.integer :micropost_id

      t.timestamps
    end
        add_index :feeds,:user_id
    add_index :feeds,:micropost_id
  end
end
