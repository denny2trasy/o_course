class CreateThinkingcaps < ActiveRecord::Migration
  def self.up
    create_table :thinkingcaps do |t|
      t.column  :name,  :string
      t.column  :show_course_id,  :string
      t.column  :image_url,   :string
      t.timestamps
    end
  end

  def self.down
    drop_table :thinkingcaps
  end
end
