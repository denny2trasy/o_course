# encoding: utf-8
class Unit < ActiveRecord::Base
  acts_as_readonly :ellis
  has_many :lessons
  belongs_to :course
end