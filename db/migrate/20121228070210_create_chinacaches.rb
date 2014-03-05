class CreateChinacaches < ActiveRecord::Migration
  def self.up
    create_table :chinacaches do |t|
      t.column  :name,  :string
      t.column  :show_chinacache_id,  :string
      t.column  :image_url,   :string
      t.timestamps
    end
  end

  def self.down
    drop_table :chinacaches
  end
end
