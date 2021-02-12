FactoryBot.define do
  factory :listing do
    product      {"Test"}
    text         {"テスト"}
    category_id  {3}
    state_id     {3}
    burden_id    {3}
    area_id      {3}
    day_id       {3}
    price        {300}

    association :user
    after(:build) do |listing|
      listing.image.attach(io: File.open('public/test_image.png'), filename: 'test_image.png')
    end
  end
end
