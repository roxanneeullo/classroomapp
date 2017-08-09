require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :username => "Username",
      :gender => "Gender",
      :contact_number => "123",
      :email => "test@mail.com",
      :password => "testtest"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Username/)
    expect(rendered).to match(/Gender/)
    expect(rendered).to match(/123/)
    expect(rendered).to match(/test@mail.com/)
    expect(rendered).to match(/testtest/)
  end
end
