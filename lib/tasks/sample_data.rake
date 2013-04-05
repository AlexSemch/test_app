namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

   admin = User.create!(nik: "admin",
                         email: "admin@admin.org",
                         password: "250989",
                         password_confirmation: "250989")
    admin.toggle!(:admin)
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
