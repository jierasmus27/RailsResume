require 'rails_helper'

RSpec.describe Institution, type: :model do
  context "relationships with other models" do
    it {is_expected.to have_many(:instructor) }

    it {is_expected.to validate_uniqueness_of(:name)}

    it {is_expected.to validate_presence_of(:name)}
  end
end
