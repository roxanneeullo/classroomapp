require 'rails_helper'

RSpec.describe User, type: :model do
  
  it 'has many students' do
    relation = described_class.reflect_on_association(:students)
    expect(relation.macro).to eq :has_many
  end
   
  it 'has many teachers' do
    relation = described_class.reflect_on_association(:teachers)
    expect(relation.macro).to eq :has_many
  end
  
  it "is valid with a first name, last name, email, and password" do
    user = User.new(
      first_name: "admin",
      last_name: "admin",
      username: "admin1",
      gender: "female",
      birthday: 1991-07-02,
      contact_number: 639201206270,
      email: "usermail@gmail.com",
      password: "AbCdEfGh9876",
      password_confirmation: "AbCdEfGh9876",
      roles_mask: 1
    )
    expect(user).to be_valid 
  end
  
  it "is invalid without a first name" do
    user = User.new(first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end
  
  it "is invalid without a last name" do
    user = User.new(last_name: nil)
    user.valid?
    expect(user.errors[:last_name]).to include("can't be blank")
  end
  
  it "is invalid without a username" do
    user = User.new(username: nil)
    user.valid?
    expect(user.errors[:username]).to include("can't be blank")
  end
  
  it "is invalid without a gender" do
    user = User.new(gender: nil)
    user.valid?
    expect(user.errors[:gender]).to include("can't be blank")
  end
  
  it "is invalid without a password" do
    user = User.new(password: nil)
    user.valid?
    expect(user.errors[:password]).to include("can't be blank")
  end
  
  it "is invalid with duplicate username" do
    User.create(
      first_name: "admin",
      last_name: "admin",
      username: "admin1",
      gender: "female",
      birthday: 1991-07-02,
      contact_number: 639201206270,
      email: "usermail@gmail.com",
      password: "AbCdEfGh9876",
      password_confirmation: "AbCdEfGh9876",
      roles_mask: 1
    )
    user = User.new(
      first_name: "admin",
      last_name: "admin",
      username: "admin1",
      gender: "female",
      birthday: 1991-07-02,
      contact_number: 639201206270,
      email: "usermail@gmail.com",
      password: "AbCdEfGh9876",
      password_confirmation: "AbCdEfGh9876",
      roles_mask: 1
    )
    user.valid?
    expect(user.errors[:username]).to include("has already been taken")
  end
  
  it "is invalid with duplicate email" do
    User.create(
      first_name: "admin",
      last_name: "admin",
      username: "admin1",
      gender: "female",
      birthday: 1991-07-02,
      contact_number: 639201206270,
      email: "usermail@gmail.com",
      password: "AbCdEfGh9876",
      password_confirmation: "AbCdEfGh9876",
      roles_mask: 1
    )
    user = User.new(
      first_name: "admin",
      last_name: "admin",
      username: "admin1",
      gender: "female",
      birthday: 1991-07-02,
      contact_number: 639201206270,
      email: "usermail@gmail.com",
      password: "AbCdEfGh9876",
      password_confirmation: "AbCdEfGh9876",
      roles_mask: 1
    )
    user.valid?
    expect(user.errors[:email]).to include("has already been taken")
  end  
end
