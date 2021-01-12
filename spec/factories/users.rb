FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.first_name}
    email                 {Faker::Internet.free_email}
    password              {"abc123"}
    password_confirmation {password}
    family_name           {Gimei::last.kanji}
    first_name            {Gimei::first.kanji}
    family_name_kana      {Gimei::last.katakana}
    first_name_kana       {Gimei::first.katakana}
    birthday           {Faker::Date.between(from: '1930-01-01', to: Date.today)}
  end
end
