require 'rails_helper'

RSpec.describe Department, type: :model do
  it 'has many courses' do
    relation = described_class.reflect_on_association(:courses)
    expect(relation.macro).to eq :has_many
  end
  it 'has many teachers' do
    relation = described_class.reflect_on_association(:teachers)
    expect(relation.macro).to eq :has_many
  end
  
  it "is valid with a name" do
    department = Department.new(
      name: "School of Information Technology",
      )
    expect(department).to be_valid 
  end
  
  it "is invalid without a name" do
    department = Department.new(name: nil)
    department.valid?
    expect(department.errors[:name]).to include("can't be blank")
  end
end
