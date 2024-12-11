FactoryBot.define do
  factory :item do
    title { Faker::Commerce.product_name } # 商品名を生成
    description { Faker::Lorem.paragraph } # 商品説明を生成
    category_id { 2 } # 有効なカテゴリーIDを設定
    condition_id { 2 } # 有効な状態IDを設定
    shipping_fee_id { 2 } # 有効な送料負担IDを設定
    prefecture_id { 2 } # 有効な発送元地域IDを設定
    delivering_day_id { 2 } # 有効な発送日数IDを設定
    price { 1000 } # 有効な価格を設定
    association :user # ユーザーとの関連付け

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
