FactoryBot.define do
  factory :user do
    nickname { Faker::Name.initials(number: 5) }
    email { Faker::Internet.unique.email }
    password { "1a#{Faker::Internet.unique.password(min_length: 6)}" }
    password_confirmation { password }
    last_name { '田中' }
    first_name { '太郎' }
    read_last { 'タナカ' }
    read_first { 'タロウ' }
    birthday { Faker::Date.birthday }
  end
end
