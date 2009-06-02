class AddProfilePictureToUsers < ActiveRecord::Migration
  def self.up
      add_column :users, :profile_picture_file_name, :string
      add_column :users, :profile_picture_content_type, :string
      add_column :users, :profile_picture_file_size, :integer
  end

  def self.down
  end
end
