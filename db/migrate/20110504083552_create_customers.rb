class CreateCustomers < ActiveRecord::Migration
  def self.up
    create_table :customers do |t|
      t.column  :short_name,  :string
      t.column  :company_name,  :string
      t.column  :payment_terms, :string
      t.column  :billing_currency,  :string  
      t.timestamps
    end
  end

  def self.down
    drop_table :customers
  end
end
