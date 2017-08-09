require 'rails_helper'

RSpec.describe TeachingLoad, type: :model do
  it 'belongs to teacher' do
    relation = described_class.reflect_on_association(:teacher)
    expect(relation.macro).to eq :belongs_to
  end
  it 'belongs to subject' do
    relation = described_class.reflect_on_association(:subject)
    expect(relation.macro).to eq :belongs_to
  end
  
  it "is invalid without teacher" do
    teaching_load = Section.new(teacher: nil)
    teaching_load.valid?
    expect(teaching_load.errors[:teacher]).to include("must exist")
  end
  it "is invalid without subejct" do
    teaching_load = Section.new(subject: nil)
    teaching_load.valid?
    expect(teaching_load.errors[:subject]).to include("must exist")
  end
  it "is valid with a user, department, block, and status" do 
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
    teaching_load = TeachingLoad.new(
      teacher_id: 1,
      subject_id: 1
    )
    expect(teaching_load).to be_valid 
  end
end
