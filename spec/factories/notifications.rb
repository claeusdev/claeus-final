FactoryGirl.define do
  factory :notification do
    store_id 1
    user_id 1
    read_at "2017-05-22 12:08:23"
    notifiable_id 1
    notifiable_type "MyString"
  end
end
