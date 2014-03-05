class AddCourseTypeToItemGroup < ActiveRecord::Migration
  def self.up
    add_column :item_groups, :course_type, :string
  end

  def self.down
    remove_column :item_groups, :course_type
  end
end
