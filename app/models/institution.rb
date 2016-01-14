class Institution < ActiveRecord::Base
  has_many :instructors
  belongs_to :parent, class_name: "Institution", foreign_key: "institution_id"
  has_many :children, class_name: "Institution", foreign_key: "institution_id"

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true
end
