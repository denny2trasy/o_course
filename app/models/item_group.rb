class ItemGroup < ActiveRecord::Base
  belongs_to  :course_package
  has_many  :items, :order => :position,  :dependent => :destroy
  # has_many  :scenarios, :order => :position
  # has_many  :third_contents, :order => :position
end
