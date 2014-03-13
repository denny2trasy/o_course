class Customer < ActiveRecord::Base
  has_many  :course_packages, :dependent => :destroy
  
  # valid_length :coments,:size=>1200
  
  def self.list_select
    res = []
    Customer.all.each do |c|
      res << "#{c.id} - #{c.company_name}"
    end
    return res
  end
end
