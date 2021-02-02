FactoryBot.define do
  factory :user do
    nickname              {"test"}
    email                 {Faker::Internet.email}
    password              {"test1234"}
    password_confirmation {"test1234"}
    family_name           {"佐藤"}
    first_name            {"太郎"}
    family_name_ruby      {"サトウ"}
    first_name_ruby       {"タロウ"}
    birthday              {"1990-03-05"}
  end
end