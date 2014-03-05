# encoding: utf-8
class Course < ActiveRecord::Base
  acts_as_readonly :ellis
  has_many :units
end