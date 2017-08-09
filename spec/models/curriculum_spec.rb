require 'rails_helper'

RSpec.describe Curriculum, type: :model do
  it 'belongs to subject' do
    relation = described_class.reflect_on_association(:subject)
    expect(relation.macro).to eq :belongs_to
  end
  it 'belongs to course' do
    relation = described_class.reflect_on_association(:course)
    expect(relation.macro).to eq :belongs_to
  end
  
  it "is invalid without a subject" do
    curriculum = Curriculum.new(subject: nil)
    curriculum.valid?
    expect(curriculum.errors[:subject]).to include("can't be blank")
  end
  it "is invalid without a course" do
    curriculum = Curriculum.new(course: nil)
    curriculum.valid?
    expect(curriculum.errors[:course]).to include("can't be blank")
  end
  
  it "is valid with a course and subject" do
    Course.create(
      name: "Computer Science",
    )
    Subject.create(
      name: "Automata",
    )
    curriculum = Curriculum.new(
      course_id: 1,
      subject_id: 1
    )
    expect(curriculum).to be_valid 
  end
end
