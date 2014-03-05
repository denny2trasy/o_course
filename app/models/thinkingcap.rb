class Thinkingcap < ActiveRecord::Base
  has_one :item,  :as => :content
end
