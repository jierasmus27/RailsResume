require 'rails_helper'

RSpec.describe Institution, type: :model do
  context "relationships with other models" do
    it {is_expected.to belong_to(:parent)}
    it {is_expected.to have_many(:instructors)}
    it {is_expected.to have_many(:children)}

    it {is_expected.to validate_uniqueness_of(:name)}

    it {is_expected.to validate_presence_of(:name)}
    it {is_expected.to validate_presence_of(:description)}
    # it {is_expected.to validate_presence_of(:parent)}
  end
end
