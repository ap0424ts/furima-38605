FactoryBot.define do
  factory :order_shipping do
    post_code { '123-4567' }
    area_id { 2 }
    city { '世田谷区' }
    addres { 'テスト町1-1-1' }
    building { 'テストビル101' }
    phone_number { '09012345678'}
  end
end