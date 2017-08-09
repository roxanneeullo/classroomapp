require 'rails_helper'

RSpec.describe Block, type: :model do
  it 'has many students' do
    relation = described_class.reflect_on_association(:students)
    expect(relation.macro).to eq :has_many
  end
  it 'belongs_to teachers' do
    relation = described_class.reflect_on_association(:teacher)
    expect(relation.macro).to eq :has_one
  end
  it "is valid with a name" do
    block = Block.new(
      name: "CS1",
      )
    expect(block).to be_valid 
  end
  it "is invalid without a name" do
    block = Block.new(name: nil)
    block.valid?
    expect(block.errors[:name]).to include("can't be blank")
  end
end
