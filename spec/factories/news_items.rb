# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :news_item do
    title "MyString"
    description "MyString"
    body "MyText"
    user
  end
end
