require 'rails_helper'

RSpec.describe "teachers/show", type: :view do
  before(:each) do
    @teacher = assign(:teacher, Teacher.create!(
      :user_id => 2,
      :department_id => 3,
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3/)
    expect(rendered).to match(/Status/)
  end
end
