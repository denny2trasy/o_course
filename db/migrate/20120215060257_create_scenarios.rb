class CreateScenarios < ActiveRecord::Migration
  def self.up
    create_table :scenarios do |t|
      t.column  :item_group_id, :integer
      t.column  :name,  :string
      t.column  :show_scenario_id,  :integer
      t.column  :position,  :integer
      t.column  :show_link,   :string
      t.timestamps
    end
  end

  def self.down
    drop_table :scenarios
  end
end
