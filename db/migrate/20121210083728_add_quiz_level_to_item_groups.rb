class AddQuizLevelToItemGroups < ActiveRecord::Migration
  def self.up
    add_column :item_groups, :quiz_level, :integer
  end

  def self.down
    remove_column :item_groups, :quiz_level
  end
end
