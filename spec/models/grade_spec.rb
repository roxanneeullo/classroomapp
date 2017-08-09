require 'rails_helper'

RSpec.describe Grade, type: :model do
  it 'belongs to student' do
    relation = described_class.reflect_on_association(:student)
    expect(relation.macro).to eq :belongs_to
  end
  it 'belongs to teacher' do
    relation = described_class.reflect_on_association(:teacher)
    expect(relation.macro).to eq :belongs_to
  end
  it 'belongs to section' do
    relation = described_class.reflect_on_association(:section)
    expect(relation.macro).to eq :belongs_to
  end
  it 'belongs to activity' do
    relation = described_class.reflect_on_association(:activity)
    expect(relation.macro).to eq :belongs_to
  end
  
  it "is invalid without a student" do
    grade = Grade.new(student: nil)
    grade.valid?
    expect(grade.errors[:student]).to include("must exist")
  end
  it "is invalid without a teacher" do
    grade = Grade.new(teacher: nil)
    grade.valid?
    expect(grade.errors[:teacher]).to include("must exist")
  end
  it "is invalid without a section" do
    grade = Grade.new(section: nil)
    grade.valid?
    expect(grade.errors[:section]).to include("must exist")
  end
  it "is invalid without an activity" do
    grade = Grade.new(activity: nil)
    grade.valid?
    expect(grade.errors[:activity]).to include("must exist")
  end
  
  it "is valid with an activity type, content, section, and teacher" do
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
    Block.create(
      name: "AC1"
    )
    Subject.create(
      name: "Automata"
    )
    Teacher.create(
      user_id: 1,
      department_id: 1,
      block_id: 1,
      status: "Full Time"
    )
    Section.create(
      name: "Auto1",
      semester: "first",
      schedule: "MWF",
      subject_id: 1,
      teacher_id: 1
    )
    Activity.create(
      activity_type: "Exam",
      content: "LQ",
      teacher_id: 1,
      section_id: 1
    )
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
    Student.create(
      user_id: 2,
      course_id: 1,
      block_id: 1,
      year_level: 1
    )
    grade = Grade.new(
      section_id: 1,
      teacher_id: 1,
      student_id: 1,
      score: 1,
      activity_id: 1
    )
    expect(grade).to be_valid 
  end
end
