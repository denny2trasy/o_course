class CreateItemGroups < ActiveRecord::Migration
  def self.up
    create_table :item_groups do |t|
      t.column  :course_package_id,   :integer
      t.column  :name,    :string
      t.column  :position,  :integer
      t.column  :credits,   :integer    # the number of view this group
      t.timestamps
    end
  end

  def self.down
    drop_table :item_groups
  end
end
