class CreateThirdContents < ActiveRecord::Migration
  def self.up
    create_table :third_contents do |t|
      t.column  :item_group_id, :integer
      t.column  :name,  :string
      t.column  :show_content_id,  :string
      t.column  :position,  :integer
      t.column  :show_link,   :string
      t.timestamps
    end
  end

  def self.down
    drop_table :third_contents
  end
end
