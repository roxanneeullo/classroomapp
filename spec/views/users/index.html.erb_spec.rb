require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :gender => "Gender",
        :contact_number => "123",
        :email => "test@mail.com",
        :password => "testtest"
      ),
      User.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :username => "Username",
        :gender => "Gender",
        :contact_number => "123",
        :email => "test@mail.com",
        :password => "testtest"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Username".to_s, :count => 2
    assert_select "tr>td", :text => "Gender".to_s, :count => 2
    assert_select "tr>td", :text => "123".to_s, :count => 2
     assert_select "tr>td", :text => "test@mail.com".to_s, :count => 2
      assert_select "tr>td", :text => "testtest".to_s, :count => 2
  end
end
