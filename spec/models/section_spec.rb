require 'rails_helper'

RSpec.describe Section, type: :model do
  it 'belongs to subject' do
    relation = described_class.reflect_on_association(:subject)
    expect(relation.macro).to eq :belongs_to
  end
  it 'belongs to teacher' do
    relation = described_class.reflect_on_association(:teacher)
    expect(relation.macro).to eq :belongs_to
  end
  
  it 'has many students' do
    relation = described_class.reflect_on_association(:students)
    expect(relation.macro).to eq :has_many
  end
  it 'has many class list' do
    relation = described_class.reflect_on_association(:class_lists)
    expect(relation.macro).to eq :has_many
  end
  it 'has many activities' do
    relation = described_class.reflect_on_association(:activities)
    expect(relation.macro).to eq :has_many
  end
  it 'has many grades' do
    relation = described_class.reflect_on_association(:grades)
    expect(relation.macro).to eq :has_many
  end
  it "is invalid without subject" do
    section = Section.new(subject: nil)
    section.valid?
    expect(section.errors[:subject]).to include("must exist")
  end
  it "is invalid without teacher" do
    section = Section.new(teacher: nil)
    section.valid?
    expect(section.errors[:teacher]).to include("must exist")
  end
  it "is invalid without name" do
    section = Section.new(name: nil)
    section.valid?
    expect(section.errors[:name]).to include("can't be blank")
  end
  it "is invalid without semester" do
    section = Section.new(semester: nil)
    section.valid?
    expect(section.errors[:semester]).to include("can't be blank")
  end
  it "is invalid without schedule" do
    section = Section.new(schedule: nil)
    section.valid?
    expect(section.errors[:schedule]).to include("can't be blank")
  end
  
  it "is valid with a teacher, name, semester, and schedule" do 
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
    Teacher.create(
      user_id: 1,
      department_id: 1,
      block_id: 1,
      status: "Full Time"
    )
    Subject.create(
      name: "Automata",
      )
    section = Section.new(
      teacher_id: 1,
      subject_id: 1,
      schedule: "MWF",
      name: "Full Time",
      semester: "first"
    )
    expect(section).to be_valid 
  end  
end
