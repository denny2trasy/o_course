class AddEleutianCourseToCoursePackage < ActiveRecord::Migration
  def self.up
    add_column  :course_packages,  :eleutian_course, :string
  end

  def self.down
    remove_column :course_packages,  :eleutian_course
  end
end
