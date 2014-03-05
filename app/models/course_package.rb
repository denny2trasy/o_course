class CoursePackage < ActiveRecord::Base
  belongs_to  :customer
  has_many  :item_groups, :order => :position,  :dependent => :destroy
  has_many  :items, :through => :item_groups
  has_many  :session_credits,  :dependent => :destroy
  has_many  :register_codes,  :dependent => :destroy
  after_create  :update_register_code
  default_scope :order => "created_at desc"
  
  def update_register_code    
    self.update_attribute(:register_code,generate_code)
  end
  
  def generate_code
    range = ("A".."Z").to_a + ("0".."9").to_a
    code = []
    (1..4).each do |m|
      temp = ""
      (1..4).each do |n|
        temp += range[rand * range.size]
      end
      code << temp
    end
    return code.join("-")
  end
  
  def self.copy(course_package)
    return false if course_package.blank?
    ActiveRecord::Base.transaction do 
      begin
        c = CoursePackage.new
        c.initialize_dup(course_package)
        c.save
        course_package.item_groups.each do |i_group|
          group = c.item_groups.new
          group.name = i_group.name
          group.position = i_group.position
          group.credits = i_group.credits
          group.course_type = i_group.course_type
          group.save
          unless i_group.items.blank?
            i_group.items.each do |i_item|
              item = group.items.new
              item.name = i_item.name
              item.content_id = i_item.content_id
              item.content_type = i_item.content_type
              item.position = i_item.position
              item.save
            end
          end
          # unless i_group.scenarios.blank?
          #   i_group.scenarios.each do |i_item|
          #     item = group.scenarios.new
          #     item.name = i_item.name
          #     item.show_scenario_id = i_item.show_scenario_id
          #     item.position = i_item.position
          #     item.show_link = i_item.show_link
          #     item.save
          #   end          
          # end
          # unless i_group.third_contents.blank?
          #   i_group.third_contents.each do |i_item|
          #     item = group.third_contents.new
          #     item.name = i_item.name
          #     item.show_content_id = i_item.show_content_id
          #     item.position = i_item.position
          #     item.show_link = i_item.show_link
          #     item.thinkingcap_course = i_item.thinkingcap_course
          #     item.save
          #   end            
          # end

        end
        return true
      rescue => e
        puts e.message
        return false
      end
    end
   
  end
  
end
