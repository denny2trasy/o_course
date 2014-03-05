class ChangeItem < ActiveRecord::Migration
  def self.up
    add_column  :items, :content_id,  :integer
    add_column  :items, :content_type,  :string
  end

  def self.down
    remove_column :items, :content_id
    remove_column :items, :content_type
  end
end
