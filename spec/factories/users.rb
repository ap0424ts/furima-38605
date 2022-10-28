FactoryBot.define do
  factory :user do
    nickname              { 'test1234' }
    email                 { Faker::Internet.free_email}
    password              { Faker::Internet.password(min_length: 6)}
    password_confirmation { password}
    last_name             { '太郎' }
    first_name            { '田中' }
    last_name_kana        { 'タロウ' }
    first_name_kana       { 'タナカ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end