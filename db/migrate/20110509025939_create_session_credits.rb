class CreateSessionCredits < ActiveRecord::Migration
  def self.up
    create_table :session_credits do |t|
      t.column  :course_package_id,   :integer
      t.column  :session_type,    :string
      t.column  :quantity,     :integer  
      t.column  :session_length,  :integer
      t.timestamps
    end
  end

  def self.down
    drop_table :session_credits
  end
end
