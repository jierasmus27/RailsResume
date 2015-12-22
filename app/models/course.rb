class Course < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true

  belongs_to :institution
  belongs_to :instructor
end
