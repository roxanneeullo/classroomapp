require 'rails_helper'

RSpec.describe Course, type: :model do
  
  it 'has many subjects' do
    relation = described_class.reflect_on_association(:subjects)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has many curriculums' do
    relation = described_class.reflect_on_association(:curriculums)
    expect(relation.macro).to eq :has_many
  end
  
  it 'has belongs to department' do
    relation = described_class.reflect_on_association(:department)
    expect(relation.macro).to eq :belongs_to
  end
  
  it "is valid with a name" do
    course = Course.new(
      name: "Computer Science",
      )
    expect(course).to be_valid 
  end
  
  it "is invalid without a name" do
    course = Course.new(name: nil)
    course.valid?
    expect(course.errors[:name]).to include("can't be blank")
  end
end
