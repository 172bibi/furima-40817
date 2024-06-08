FactoryBot.define do
  factory :user do
    transient do
      person { Gimei.name }
    end
    nickname { Faker::Name.initials(number: 3) }
    email {Faker::Internet.email}
    password { "a1" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    lastname { person.first.kanji }
    firstname { person.last.kanji }
    lastnamekana { person.first.katakana }
    firstnamekana { person.last.katakana }
    birthday { Faker::Date.backward }
  end
end