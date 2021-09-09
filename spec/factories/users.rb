FactoryBot.define do
  factory :user do
    nickname {Faker::Name.last_name}
    email {Faker::Internet.free_email}
    password {'a1' + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    last_name {'山田'}
    first_name {'隆太郎'}
    last_name_kana {'ヤマダ'}
    first_name_kana {'リクタロ'}
    birthday {Faker::Date.backward}
  end
end
