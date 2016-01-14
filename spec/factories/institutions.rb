FactoryGirl.define do
  sequence :name do |n|
    "Institution#{n}"
  end

  factory :institution do
    name
    description "MyText"
    image "MyString"

    factory :institution_with_children do
      after(:create) do |institution|
        create(:institution, parent: institution, institution_id: institution.id)
      end
    end
  end

end
