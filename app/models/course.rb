class Course < ActiveRecord::Base
  belongs_to :institution
  belongs_to :instructor

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true  
end
