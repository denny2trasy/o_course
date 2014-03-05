class Chinacache < ActiveRecord::Base
  has_one :item,  :as => :content
end
