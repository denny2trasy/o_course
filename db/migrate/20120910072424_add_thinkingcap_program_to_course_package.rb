class AddThinkingcapProgramToCoursePackage < ActiveRecord::Migration
  def self.up
    add_column :course_packages,  :thinkingcap_program, :string
  end

  def self.down
    remove_column :course_packages,  :thinkingcap_program
  end
end
