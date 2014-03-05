class AddDescToRegisterCode < ActiveRecord::Migration
  def self.up
    add_column :register_codes, :desc, :text
  end

  def self.down
    remove_column :register_codes, :desc
  end
end
