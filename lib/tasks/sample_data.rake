namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    make_admin
    make_teacher
    #make_users
    #make_microposts
    #make_relationships
    #make_students
    #make_tests
  end
end
def make_admin
  admin = User.create!(nik:  "admin",
                       email: "admin@admin.org",
                       password: "250989",
                       password_confirmation: "250989")
  admin.toggle!(:admin)
   
end

def make_teacher
  teacher = User.new(  nik:  "teacher",
                       email: "teacher@teacher.org",
                       password: "12345678",
                       password_confirmation: "12345678")
  teacher.rol = 'teacher'
  teacher.save
  #teacher.assign_attributes(rol: :teacher, :without_protection => true)
  
end

def make_users
  99.times do |n|
    name = Faker::Name.name
    email = "example-#{n+1}@railstutorial.org"
    password = "password"
    User.create!(nik: name,
                 email: email,
                 password: password,
                 password_confirmation: password)
  end
end
def make_microposts
  users = User.all(limit: 6)
  50.times do
    content = Faker::Lorem.sentence(5)
    users.each { |user| user.microposts.create!(content: content) }
  end
end

# Створити тести 
def make_tests
  
  20.times do |mt|
    test_n = 'Tes namber ' + mt.to_s + Faker::Lorem.sentence(5)
    descr = 'Comments # ' + mt.to_s
    Dtest.create!(
        test_name: test_n,
        test_descr: descr
    )
  end
end

def make_relationships
  users = User.all
  user = users.first
  followed_users = users[2..50]
  followers  = users[3..40]
  followed_users.each { |followed| user.follow!(followed) }
  followers.each   { |follower| follower.follow!(user) }
end

def make_students
     20.times do |st|
       f_name = Faker::Name.first_name
       n_name = Faker::Name.title
       s_name = Faker::Name.last_name
       dec = Faker::PhoneNumber.phone_number
       c_of_test = st + 1
       r_ball = rand(1..5)
       r_clas = rand(5..12)
       stud = Student.create!( first_name: f_name,
                        name: n_name,
                        second_name: s_name,
                        class_st: r_clas,
                        #count_of_test: c_of_test, #This is wrong!!
                        #round_ball: r_ball,       #this is wrong!!!
                        descr_st: dec )

       stud.count_of_test = c_of_test
       stud.round_ball = r_ball
       stud.save!
     end
end