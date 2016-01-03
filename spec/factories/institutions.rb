FactoryGirl.define do
  sequence :name do |n|
    "Institution#{n}"
  end

  factory :institution do
    name
    description "MyText"
    image "MyString"
    institution nil
  end

end
