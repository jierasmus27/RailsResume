require 'rails_helper'

RSpec.describe Instructor, type: :model do
  context "relationships with other models" do
    it {is_expected.to have_many(:courses) }

    it {is_expected.to belong_to(:institution) }

    it {is_expected.to validate_uniqueness_of(:name)}

    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:institution)}
  end
end
