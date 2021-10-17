FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password { Faker::Lorem.characters(number: 6, min_alpha: 1, min_numeric: 1) }
    password_confirmation { password }
    family_name { Gimei.last.kanji or Gimei.last.hiragana or Gimei.last.katakana }
    first_name { Gimei.first.katakana or Gimei.first.hiragana or Gimei.first.kanji }
    family_name_kana { Gimei.last.katakana }
    first_name_kana { Gimei.first.katakana }
    birth_day {Faker::Date.birthday }
  end
end