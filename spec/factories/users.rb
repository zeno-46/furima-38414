FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    last_name             {'テスト'}
    first_name            {'フリマ'}
    last_name_kana        {'テスト'}
    first_name_kana       {'フリマ'}
    email                 {Faker::Internet.free_email}
    birthday              {'1994-05-16'}
    password              {'a123456'}
    password_confirmation {password}
  end
end