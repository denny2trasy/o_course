class AddImageUrlToScenarios < ActiveRecord::Migration
  def self.up
    add_column :scenarios, :image_url, :string
  end

  def self.down
    remove_column :scenarios, :image_url
  end
end
