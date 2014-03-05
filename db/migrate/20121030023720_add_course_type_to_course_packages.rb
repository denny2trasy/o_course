class AddCourseTypeToCoursePackages < ActiveRecord::Migration
  def self.up
    add_column :course_packages, :course_type, :string
  end

  def self.down
    remove_column :course_packages, :course_type
  end
end
