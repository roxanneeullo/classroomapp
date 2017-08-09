require 'rails_helper'

RSpec.describe ClassList, type: :model do
  it 'belongs to student' do
    relation = described_class.reflect_on_association(:student)
    expect(relation.macro).to eq :belongs_to
  end
  
  it 'belongs to section' do
    relation = described_class.reflect_on_association(:section)
    expect(relation.macro).to eq :belongs_to
  end
  
  it "is invalid without section" do
    class_list = ClassList.new(section: nil)
    class_list.valid?
    expect(class_list.errors[:section]).to include("must exist")
  end
  it "is invalid without student" do
    class_list = ClassList.new(student: nil)
    class_list.valid?
    expect(class_list.errors[:student]).to include("must exist")
  end
  
  it "is valid with a student and section" do 
    User.create(
      first_name: "admin",
      last_name: "admin",
      username: "admin1",
      gender: "female",
      birthday: 1991-07-02,
      contact_number: 639201206270,
      email: "usermail@gmail.com",
      password: "AbCdEfGh9876",
      password_confirmation: "AbCdEfGh9876"
    )
    Course.create(
      name: "Computer Science"
    )
    Block.create(
      name: "AC1"
    )
    Student.create(
      user_id: 1,
      course_id: 1,
      block_id: 1,
      year_level: 1
    )
    User.create(
      first_name: "teacher",
      last_name: "teacher",
      username: "teacher1",
      gender: "female",
      birthday: 1991-07-02,
      contact_number: 639201206270,
      email: "usermail@gmail.com",
      password: "AbCdEfGh9876",
      password_confirmation: "AbCdEfGh9876"
    )
    Department.create(
      name: "School of Information Technology"
    )
    Teacher.create(
      user_id: 1,
      department_id: 1,
      block_id: 1,
      status: "Full Time"
    )
    Subject.create(
      name: "Automata",
    )
    Section.create(
      teacher_id: 1,
      subject_id: 1,
      schedule: "MWF",
      name: "Full Time",
      semester: "first"
    )
    class_list = ClassList.new(
      student_id: 1,
      section_id: 1,
    )
    expect(class_list).to be_valid 
  end
end
