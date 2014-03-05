class AddCommentToTrainers < ActiveRecord::Migration
  def self.up
    add_column :trainers, :comments,:string
  end

  def self.down
    remove_column :trainers, :comments
  end
end
