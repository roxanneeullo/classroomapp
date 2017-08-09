require 'rails_helper'

RSpec.describe "teachers/index", type: :view do
  before(:each) do
    assign(:teachers, [
      Teacher.create!(
        :user_id => 2,
        :department_id => 3,
        :status => "Status"
      ),
      Teacher.create!(
        :user_id => 2,
        :department_id => 3,
        :status => "Status"
      )
    ])
  end

  it "renders a list of teachers" do
    render
    assert_select "tr>td", :text => 2.to_s, :count => 2
    assert_select "tr>td", :text => 3.to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
