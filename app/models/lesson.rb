class Lesson < ActiveRecord::Base
  acts_as_readonly :ellis
  default_scope :order => "name"
  belongs_to :unit
  has_one :item,  :as => :content
end