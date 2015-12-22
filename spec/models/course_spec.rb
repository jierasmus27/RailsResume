require 'rails_helper'

RSpec.describe Course, type: :model do
  context "relationships with other models" do
    it {is_expected.to belong_to(:instructor) }
    it {is_expected.to belong_to(:institution) }

    it {is_expected.to validate_uniqueness_of(:name)}

    it {is_expected.to validate_presence_of(:name)}
  end
end
