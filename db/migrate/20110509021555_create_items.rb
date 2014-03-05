class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.column  :item_group_id, :integer
      t.column  :name,    :string
      t.column  :lesson_id,  :integer
      t.column  :position,  :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :items
  end
end
