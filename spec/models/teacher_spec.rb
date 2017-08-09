require 'rails_helper'

RSpec.describe Teacher, type: :model do
  it "is valid with a user, department, block, and status" do 
    User.new(
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
    Department.new(
      name: "School of Information Technology"
    )
    
    Block.new(
      name: "AC1"
    )
    
    teacher =Teacher.new(
      user_id: 1,
      department_id: 1,
      block_id: 1,
      status: "Full Time"
    )
    expect(teacher).to be_valid 
  end
  
  it "is invalid with duplicate block" do
    Teacher.create(
    user_id: 1,
    department_id: 1,
    block_id: 1,
    status: "Full Time"
      )
      teacher = Teacher.new(
      user_id: 2,
      department_id: 1,
      block_id: 1,
      status: "Full Time"
        )
        teacher.valid?
        expect(teacher.errors[:block]).to include("Oops")
  end
  
  it "is invalid without a department" do
    teacher = Teacher.new(department: nil)
    teacher.valid?
    expect(teacher.errors[:department]).to include("can't be blank")
  end
  
  it 'has many teaching loads' do
    relation = described_class.reflect_on_association(:teaching_loads)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has many subjects' do
    relation = described_class.reflect_on_association(:subjects)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has many section' do
    relation = described_class.reflect_on_association(:sections)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has many grades' do
    relation = described_class.reflect_on_association(:grades)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has many activities' do
    relation = described_class.reflect_on_association(:activities)
    expect(relation.macro).to eq :has_many
  end
  
  it 'belongs to department' do
    relation = described_class.reflect_on_association(:department)
    expect(relation.macro).to eq :belongs_to
  end
  
  it 'belongs to user' do
    relation = described_class.reflect_on_association(:user)
    expect(relation.macro).to eq :belongs_to
  end
  
  it 'belongs to block' do
    relation = described_class.reflect_on_association(:block)
    expect(relation.macro).to eq :belongs_to
  end
  
end
