require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :user_id => 1,
      :course_id => 1,
      :year_level => 1
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input#student_user_id[name=?]", "student[user_id]"

      assert_select "input#student_course_id[name=?]", "student[course_id]"

      assert_select "input#student_year_level[name=?]", "student[year_level]"
    end
  end
end
