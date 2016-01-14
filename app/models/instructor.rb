class Instructor < ActiveRecord::Base
  has_many :courses
  belongs_to :institution

  validates :name, presence: true
  validates :institution, presence: true
  validates :description, presence: true
end
