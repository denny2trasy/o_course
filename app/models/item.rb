class Item < ActiveRecord::Base
  belongs_to  :item_group
  # belongs_to  :lesson
  belongs_to  :content, :polymorphic => true
  
  def content_link
    link = ""
    if self.content.is_a?(Lesson)
      link = self.content.id
    elsif self.content.is_a?(Scenario)
      link = self.content.show_scenario_id
    elsif self.content.is_a?(Thinkingcap)
      link = self.content.show_course_id
    elsif self.content.is_a?(Chinacache)
      link = self.content.show_chinacache_id
    end
  end
  
end
