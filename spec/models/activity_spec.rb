require 'rails_helper'

RSpec.describe Activity, type: :model do
  it 'has many grades' do
    relation = described_class.reflect_on_association(:grades)
    expect(relation.macro).to eq :has_many
  end
  it 'has many comments' do
    relation = described_class.reflect_on_association(:comments)
    expect(relation.macro).to eq :has_many
  end
  it 'belongs to teacher' do
    relation = described_class.reflect_on_association(:teacher)
    expect(relation.macro).to eq :belongs_to
  end
  it 'belongs to section' do
    relation = described_class.reflect_on_association(:section)
    expect(relation.macro).to eq :belongs_to
  end
  it "is invalid without an activity type" do
    activity = Activity.new(activity_type: nil)
    activity.valid?
    expect(activity.errors[:activity_type]).to include("can't be blank")
  end
  it "is invalid without content" do
    activity = Activity.new(content: nil)
    activity.valid?
    expect(activity.errors[:content]).to include("can't be blank")
  end
  it "is invalid without section" do
    activity = Activity.new(section: nil)
    activity.valid?
    expect(activity.errors[:section]).to include("must exist")
  end
  it "is invalid without teacher" do
    activity = Activity.new(teacher: nil)
    activity.valid?
    expect(activity.errors[:teacher]).to include("must exist")
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
    activity = Activity.new(
      activity_type: "Exam",
      content: "LQ",
      teacher_id: 1,
      section_id: 1
      )
    expect(activity).to be_valid 
  end
end
