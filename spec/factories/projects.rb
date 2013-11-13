# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :project do
    name "MyString"
    description "MyString"
    user nil
    x_name "MyString"
    y_name "MyString"
    data ""
  end
end
