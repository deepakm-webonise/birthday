50.times do
  User.create!(
    uid: Faker::Number.number(21),
    name: Faker::Name.name,
    email: Faker::Internet.email,
    avatar: Faker::Avatar.image(
      Faker::Internet.slug,
      "50x50",
      "jpg"#,
      # "set#{Faker::Number.between(1, 6)}",
      # "bg#{Faker::Number.between(1, 6)}"
    ),
    birthday: Faker::Date.between(15.days.ago, 15.days.from_now),
    provider: "google_oauth2",
    oauth_token: Faker::Lorem.characters(81)
  )
end
