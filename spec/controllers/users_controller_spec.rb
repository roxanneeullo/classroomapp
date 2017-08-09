require 'rails_helper'


RSpec.describe UsersController, type: :controller do
  render_views

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  before(:each) do
    @request.env["devise.mapping"] = Devise.mappings[:user]
  end
  
  context "create" do
    before(:each) do
      @user_params = {
        first_name: "admin",
        last_name: "admin",
        username: "admin1",
        gender: "female",
        birthday: 1991-07-02,
        contact_number: 639201206270,
        email: "usermail@gmail.com",
        password: "AbCdEfGh9876",
        password_confirmation: "AbCdEfGh9876"
      }
    end
  end
  
  it "should create new user" do
    expect(User).to change{User.count}.from(0).to(1) do
     # post :create, user: @user_params
    end
  end 
  
  
end
