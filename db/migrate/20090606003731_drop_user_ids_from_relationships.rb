class DropUserIdsFromRelationships < ActiveRecord::Migration
  def self.up
    remove_column :relationships, :first_user_id
    remove_column :relationships, :second_user_id
  end

  def self.down
    add_column :relationships, :first_user_id, :integer
    add_column :relationships, :second_user_id, :integer
  end
end
