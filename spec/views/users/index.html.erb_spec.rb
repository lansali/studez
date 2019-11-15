require 'rails_helper'

RSpec.describe "users/index", type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :email => "Email",
        :password => "Password",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :institution_name => "Institution Name",
        :bio => "MyText",
        :course_name => "Course Name",
        :year_started_course => "9.99",
        :expected_graduation_year => "9.99",
        :interests => ""
      ),
      User.create!(
        :email => "Email",
        :password => "Password",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :last_name => "Last Name",
        :institution_name => "Institution Name",
        :bio => "MyText",
        :course_name => "Course Name",
        :year_started_course => "9.99",
        :expected_graduation_year => "9.99",
        :interests => ""
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Password".to_s, :count => 2
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Middle Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Institution Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Course Name".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "9.99".to_s, :count => 2
    assert_select "tr>td", :text => "".to_s, :count => 2
  end
end
