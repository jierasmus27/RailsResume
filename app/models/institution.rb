class Institution < ActiveRecord::Base
  has_many :instructor
  belongs_to :institution

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
