FactoryBot.define do
  factory :user do

    nickname { Faker::Name.name }
    email { Faker::Internet.unique.email }
    # パスワードのランダム生成時に、英数字が少なくとも1文字ずつ入るように'1a'を追加
    password { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '陸太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'リクタロウ' }
    birth_date { Faker::Date.birthday }
  end
end