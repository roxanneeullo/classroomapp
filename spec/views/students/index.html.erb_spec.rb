require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :user_id => 2,
        :course_id => 3,
        :year_level => 4
      ),
      Student.create!(
        :user_id => 2,
        :course_id => 3,
        :year_level => 4
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => 4.to_s, :count => 2
  end
end
