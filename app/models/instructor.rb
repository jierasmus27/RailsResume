class Instructor < ActiveRecord::Base
  has_many :courses
  belongs_to :institution

  validates :name, presence: true, uniqueness: true
end
