require 'rails_helper'

RSpec.describe Subject, type: :model do
  it 'has many curriculum' do
    relation = described_class.reflect_on_association(:curriculums)
    expect(relation.macro).to eq :has_many
  end
  it 'has many courses' do
    relation = described_class.reflect_on_association(:courses)
    expect(relation.macro).to eq :has_many
  end
  it 'has many teaching_loads' do
    relation = described_class.reflect_on_association(:teaching_loads)
    expect(relation.macro).to eq :has_many
  end
  it 'has many teachers' do
    relation = described_class.reflect_on_association(:teachers)
    expect(relation.macro).to eq :has_many
  end
  it 'has many sections' do
    relation = described_class.reflect_on_association(:sections)
    expect(relation.macro).to eq :has_many
  end
  
  it "is valid with a name" do
    subject = Subject.new(
      name: "Automata",
      )
    expect(subject).to be_valid 
  end
  
  it "is invalid without a name" do
    subject = Subject.new(name: nil)
    subject.valid?
    expect(subject.errors[:name]).to include("can't be blank")
  end
end
