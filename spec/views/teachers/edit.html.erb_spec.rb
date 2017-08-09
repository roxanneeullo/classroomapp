require 'rails_helper'

RSpec.describe "teachers/edit", type: :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.create!(
      :user_id => 1,
      :department_id => 1,
      :status => "MyString"
    ))
  end

  it "renders the edit teacher form" do
    render

    assert_select "form[action=?][method=?]", teacher_path(@teacher), "post" do

      assert_select "input#teacher_user_id[name=?]", "teacher[user_id]"

      assert_select "input#teacher_department_id[name=?]", "teacher[department_id]"

      assert_select "input#teacher_status[name=?]", "teacher[status]"
    end
  end
end
