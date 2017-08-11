require 'rails_helper'

RSpec.describe Student, type: :model do
  
  it 'has many curriculums' do
    relation = described_class.reflect_on_association(:curriculums)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has many sections' do
    relation = described_class.reflect_on_association(:sections)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has many class lists' do
    relation = described_class.reflect_on_association(:class_lists)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has many grades' do
    relation = described_class.reflect_on_association(:grades)
    expect(relation.macro).to eq :has_many
  end
  
  it 'belongs to user' do
    relation = described_class.reflect_on_association(:user)
    expect(relation.macro).to eq :belongs_to
  end
  
  it 'belongs to course' do
    relation = described_class.reflect_on_association(:course)
    expect(relation.macro).to eq :belongs_to
  end
  
  it 'belongs to block' do
    relation = described_class.reflect_on_association(:block)
    expect(relation.macro).to eq :belongs_to
  end
  
  it 'belongs to department' do
    relation = described_class.reflect_on_association(:department)
    expect(relation.macro).to eq :belongs_to
  end
  
  it "is valid with a user, course, block, and year level" do 
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
    student = Student.new(
      user_id: 1,
      course_id: 1,
      block_id: 1,
      year_level: 1
      )
    expect(student).to be_valid 
  end
  it "is invalid without a year level" do
    student = Student.new(year_level: nil)
    student.valid?
    expect(student.errors[:year_level]).to include("can't be blank")
  end
  
  it "is invalid without a course" do
    student = Student.new(course: nil)
    student.valid?
    expect(student.errors[:course]).to include("can't be blank")
  end
  
  it "is invalid without a block" do
    student = Student.new(block: nil)
    student.valid?
    expect(student.errors[:block]).to include("can't be blank")
  end
  
end
