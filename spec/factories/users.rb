FactoryBot.define do
  factory :user do
    nickname              {'test'}
    email                 {'test@example'}
    password              {'chiharu0308'}
    password_confirmation {password}
    family_name           {'かき'}
    first_name            {'もと'}
    family_name_kana      {'カキ'}
    first_name_kana       {'モト'}
    birth_day             {'1989,5,5'}
  end
end