class ChangeLessionToLesson < ActiveRecord::Migration
  def self.up
    rename_column :items, :lession_id,  :lesson_id
  end

  def self.down
    rename_column :items, :lesson_id, :lession_id
  end
end
