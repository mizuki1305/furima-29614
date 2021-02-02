FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.email}
    password              {"test1234"}
    password_confirmation {"test1234"}
    family_name           {"テスト"}
    first_name            {"テスト"}
    family_name_ruby      {"テスト"}
    first_name_ruby       {"テスト"}
    birthday              {"1990-03-05"}
  end
end