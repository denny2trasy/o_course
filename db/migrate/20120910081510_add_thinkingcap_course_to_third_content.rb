class AddThinkingcapCourseToThirdContent < ActiveRecord::Migration
  def self.up
    add_column  :third_contents,  :thinkingcap_course,  :string
  end

  def self.down
    remove_column :third_contents,  :thinkingcap_course
  end
end
