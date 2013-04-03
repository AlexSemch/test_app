namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(nik: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
    99.times do |n|
      nik  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(nik: nik,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end