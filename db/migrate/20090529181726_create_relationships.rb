class CreateRelationships < ActiveRecord::Migration
  def self.up
    create_table :relationships do |t|
      t.integer :first_user_id
      t.integer :second_user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :relationships
  end
end
