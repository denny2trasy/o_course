class CreateRegisterCodes < ActiveRecord::Migration
  def self.up
    create_table :register_codes do |t|
      t.column :user_id, :integer
      t.column :course_package_id, :integer
      t.column :code, :string
      t.column :status, :boolean
      t.timestamps 
    end
  end

  def self.down
    drop_table :register_codes
  end
end
