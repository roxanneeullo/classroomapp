
Course.delete_all
Department.delete_all
Subject.delete_all
Curriculum.delete_all
Block.delete_all
User.delete_all
Student.delete_all
Teacher.delete_all

#6 courses
  Course.create(name: 'Computer Science' )
  Course.create(name: 'Information Technology' )
  Course.create(name: 'Nursing' )
  Course.create(name: 'Physical Therapy' )
  Course.create(name: 'Accounting' )
  Course.create(name: 'Hotel and Restaurant Management' )
  
#3 Departments 
  Department.create(name: 'School of Information Technology' )
  Department.create(name: 'School of Medicine' )
  Department.create(name: 'School of Business Management' )  
  
#15 Subjects
  Subject.create(name: 'Math' ) 
  Subject.create(name: 'English' )   
  Subject.create(name: 'Filipino' )   
  Subject.create(name: 'Social Studies' )   
  Subject.create(name: 'Object Oriented Programming' )   
  Subject.create(name: 'Database' )   
  Subject.create(name: 'Algorithm' )   
  Subject.create(name: 'Automata' )   
  Subject.create(name: 'Medical Surgical Nursing' )   
  Subject.create(name: 'Pharmacology' )   
  Subject.create(name: 'Pathophysiology' )   
  Subject.create(name: 'Fundamentals of Nursing' )   
  Subject.create(name: 'Statistics' )   
  Subject.create(name: 'Finance' )   
  Subject.create(name: 'Entrepreneurship' )
  Subject.create(name: 'Multimedia' )   
  Subject.create(name: 'Troubleshooting' )   
  Subject.create(name: 'Economics' )   
  Subject.create(name: 'Housekeeping Procedures' )
  Subject.create(name: 'Human Anatomy' )  
  Subject.create(name: 'Physiology' )       

# Curriculums
  Curriculum.create(course_id: 1, subject_id: 1)
  Curriculum.create(course_id: 1, subject_id: 2)  
  Curriculum.create(course_id: 1, subject_id: 3)  
  Curriculum.create(course_id: 1, subject_id: 4)  
  Curriculum.create(course_id: 1, subject_id: 5)  
  Curriculum.create(course_id: 1, subject_id: 6)  
  Curriculum.create(course_id: 1, subject_id: 7)  
  Curriculum.create(course_id: 1, subject_id: 8)  
  
  Curriculum.create(course_id: 2, subject_id: 1)
  Curriculum.create(course_id: 2, subject_id: 2)
  Curriculum.create(course_id: 2, subject_id: 3)
  Curriculum.create(course_id: 2, subject_id: 4)
  Curriculum.create(course_id: 2, subject_id: 16)
  Curriculum.create(course_id: 2, subject_id: 17)

  Curriculum.create(course_id: 3, subject_id: 1)
  Curriculum.create(course_id: 3, subject_id: 2)
  Curriculum.create(course_id: 3, subject_id: 3)
  Curriculum.create(course_id: 3, subject_id: 4)
  Curriculum.create(course_id: 3, subject_id: 9)
  Curriculum.create(course_id: 3, subject_id: 10)
  Curriculum.create(course_id: 3, subject_id: 11)
  Curriculum.create(course_id: 3, subject_id: 12)
  
  Curriculum.create(course_id: 4, subject_id: 1) 
  Curriculum.create(course_id: 4, subject_id: 2) 
  Curriculum.create(course_id: 4, subject_id: 3) 
  Curriculum.create(course_id: 4, subject_id: 4) 
  Curriculum.create(course_id: 4, subject_id: 20) 
  Curriculum.create(course_id: 4, subject_id: 21)
  
  Curriculum.create(course_id: 5, subject_id: 1)  
  Curriculum.create(course_id: 5, subject_id: 2)  
  Curriculum.create(course_id: 5, subject_id: 3)  
  Curriculum.create(course_id: 5, subject_id: 4)  
  Curriculum.create(course_id: 5, subject_id: 13)  
  Curriculum.create(course_id: 5, subject_id: 14)  
  Curriculum.create(course_id: 5, subject_id: 15) 
  
  Curriculum.create(course_id: 6, subject_id: 1)
  Curriculum.create(course_id: 5, subject_id: 2)  
  Curriculum.create(course_id: 5, subject_id: 3)  
  Curriculum.create(course_id: 5, subject_id: 4)  
  Curriculum.create(course_id: 5, subject_id: 18)  
  Curriculum.create(course_id: 5, subject_id: 19)  

#blocks
  Block.create(name: 'CS1' ) 
  Block.create(name: 'CS2' ) 
  Block.create(name: 'CS3' ) 
  Block.create(name: 'CS4' ) 
  Block.create(name: 'IT1' ) 
  Block.create(name: 'IT2' ) 
  Block.create(name: 'IT3' ) 
  Block.create(name: 'IT4' ) 
  Block.create(name: 'NSG1' ) 
  Block.create(name: 'NSG2' ) 
  Block.create(name: 'NSG3' ) 
  Block.create(name: 'NSG4' ) 
  Block.create(name: 'PT1' ) 
  Block.create(name: 'PT2' ) 
  Block.create(name: 'PT3' ) 
  Block.create(name: 'PT4' ) 
  Block.create(name: 'ACT1' ) 
  Block.create(name: 'ACT2' ) 
  Block.create(name: 'ACT3' ) 
  Block.create(name: 'ACT4' ) 
  Block.create(name: 'HRM1' ) 
  Block.create(name: 'HRM2' ) 
  Block.create(name: 'HRM3' ) 
  Block.create(name: 'HRM4' ) 

# 5 admins
(1..5).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["admin",i].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(25, 65)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 1
  password   = username
  
  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
    username: username, password: password, birthday: birthday, contact_number: contact_number,
    roles_mask: roles_mask )
end


# 8 SOIT teachers
(1..8).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["prof",first_name.split.map(&:chr)*'', last_name].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(25, 65)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 2
  password   = username
  
  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
    username: username, password: password, birthday: birthday, contact_number: contact_number,
    roles_mask: roles_mask ) 
  
  department_id = 1
  status        = ["Full Time", "Part Time"].shuffle.first
  user_id       = i + 5
  block_id      = i
  Teacher.create(user_id: user_id, department_id: department_id, status: status, block_id: block_id)
end

# 8 SOM teachers
(1..8).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["prof",first_name.split.map(&:chr)*'', last_name].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(25, 65)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 2
  password   = username
  
  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
    username: username, password: password, birthday: birthday, contact_number: contact_number,
    roles_mask: roles_mask )
    
  
  department_id = 2
  status        = ["Full Time", "Part Time"].shuffle.first
  user_id       = i + 13
  block_id      = i + 8
  Teacher.create(user_id: user_id, department_id: department_id, status: status, block_id: block_id)
end

# 8 SOBM teachers
(1..8).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["prof",first_name.split.map(&:chr)*'', last_name].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(25, 65)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 2
  password   = username
  
  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
    username: username, password: password, birthday: birthday, contact_number: contact_number,
    roles_mask: roles_mask )
    
  
  department_id = 3
  status        = ["Full Time", "Part Time"].shuffle.first
  user_id       = i + 21
  block_id      = i + 16
  Teacher.create(user_id: user_id, department_id: department_id, status: status, block_id: block_id)
end


# CS students
(1..4).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["stud",first_name.split.map(&:chr)*'', last_name].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(16, 30)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 4
  password       = username
  
  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
    username: username, password: password, birthday: birthday, contact_number: contact_number,
    roles_mask: roles_mask )
    
  
  course_id      = 1
  year_level     = i
  user_id        = i + 29
  block_id      = i
  department_id = 1
  
  Student.create(user_id: user_id, course_id: course_id, year_level: year_level, block_id: block_id, department_id: department_id)

end  
  
# IT students
(1..4).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["stud",first_name.split.map(&:chr)*'', last_name].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(16, 30)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 4
  password       = username

  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
      username: username, password: password, birthday: birthday, contact_number: contact_number,
      roles_mask: roles_mask )
  course_id      = 2
  year_level     = i
  user_id        = i + 33
  block_id      = i + 4
  department_id = 1
  
  Student.create(user_id: user_id, course_id: course_id, year_level: year_level, block_id: block_id, department_id: department_id)
 
end 
  

# Nursing students
(1..4).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["stud",first_name.split.map(&:chr)*'', last_name].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(16, 30)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 4
  password       = username
  
  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
      username: username, password: password, birthday: birthday, contact_number: contact_number,
      roles_mask: roles_mask )
    
  course_id      = 3
  year_level     = i
  user_id        = i + 37
  block_id      = i + 8
  department_id = 2

  Student.create(user_id: user_id, course_id: course_id, year_level: year_level, block_id: block_id, department_id: department_id)
end

# PT students
(1..4).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["stud",first_name.split.map(&:chr)*'', last_name].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(16, 30)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 4
  password       = username
  
  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
       username: username, password: password, birthday: birthday, contact_number: contact_number,
       roles_mask: roles_mask )
    
  course_id      = 4
  year_level     = i
  user_id        = i + 41
  block_id      = i + 12
  department_id = 2

  Student.create(user_id: user_id, course_id: course_id, year_level: year_level, block_id: block_id, department_id: department_id)
end
      
# ACCT students
(1..4).each do |i|
  first_name     = Faker::Name.first_name
  last_name      = Faker::Name.last_name
  email          = Faker::Internet.free_email("#{first_name} #{last_name}")
  username       = ["stud",first_name.split.map(&:chr)*'', last_name].join
  gender         = ["Male", "Female"].shuffle.first
  birthday       = Faker::Date.birthday(16, 30)
  contact_number = Faker::PhoneNumber.cell_phone
  roles_mask     = 4
  password       = username
  
  User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
        username: username, password: password, birthday: birthday, contact_number: contact_number,
        roles_mask: roles_mask )
    
    course_id      = 5
    year_level     = i
    user_id        = i + 45
    block_id      = i + 16
    department_id = 3
  Student.create(user_id: user_id, course_id: course_id, year_level: year_level, block_id: block_id, department_id: department_id)
end
        
# HRM students
(1..4).each do |i|
    first_name     = Faker::Name.first_name
    last_name      = Faker::Name.last_name
    email          = Faker::Internet.free_email("#{first_name} #{last_name}")
    username       = ["stud",first_name.split.map(&:chr)*'', last_name].join
    gender         = ["Male", "Female"].shuffle.first
    birthday       = Faker::Date.birthday(16, 30)
    contact_number = Faker::PhoneNumber.cell_phone
    roles_mask     = 4
    password       = username
  
    User.create(first_name: first_name, last_name: last_name, email: email, gender: gender, 
        username: username, password: password, birthday: birthday, contact_number: contact_number,
        roles_mask: roles_mask )
    
    course_id      = 6
    year_level     = i
    user_id        = i + 49
    block_id      = i + 20
    department_id = 3
    
  Student.create(user_id: user_id, course_id: course_id, year_level: year_level, block_id: block_id, department_id: department_id)
end
