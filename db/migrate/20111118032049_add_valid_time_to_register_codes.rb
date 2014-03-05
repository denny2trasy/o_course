class AddValidTimeToRegisterCodes < ActiveRecord::Migration
  def self.up
    add_column :register_codes, :valid_time, :datetime
  end

  def self.down
    remove_column :register_codes, :valid_time
  end
end
