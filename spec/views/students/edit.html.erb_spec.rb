require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :user_id => 1,
      :course_id => 1,
      :year_level => 1
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input#student_user_id[name=?]", "student[user_id]"

      assert_select "input#student_course_id[name=?]", "student[course_id]"

      assert_select "input#student_year_level[name=?]", "student[year_level]"
    end
  end
end
