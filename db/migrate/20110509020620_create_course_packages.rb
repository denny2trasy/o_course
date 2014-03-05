class CreateCoursePackages < ActiveRecord::Migration
  def self.up
    create_table :course_packages do |t|
      t.column    :customer_id,   :integer
      t.column    :name,    :string
      t.column    :valid_for, :integer
      t.column    :description, :text
      t.column    :register_code,   :string
      t.column    :number_of_users,   :integer
      t.column    :require_address,   :boolean,   :default => false
      t.column    :start_at,    :datetime
      t.column    :end_at,      :datetime
      t.timestamps
    end
    add_index :course_packages, :customer_id 
  end

  def self.down
    drop_table :course_packages
  end
end
