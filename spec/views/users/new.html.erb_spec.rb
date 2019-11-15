require 'rails_helper'

RSpec.describe "users/new", type: :view do
  before(:each) do
    assign(:user, User.new(
      :email => "MyString",
      :password => "",
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :institution_name => "MyString",
      :bio => "MyText",
      :course_name => "MyString",
      :year_started_course => "9.99",
      :expected_graduation_year => "9.99",
      :interests => "MyText"
    ))
  end

  it "renders new user form" do
    render

    assert_select "form[action=?][method=?]", users_path, "post" do

      assert_select "input[name=?]", "user[email]"

      assert_select "input[name=?]", "user[password]"

      assert_select "input[name=?]", "user[first_name]"

      assert_select "input[name=?]", "user[middle_name]"

      assert_select "input[name=?]", "user[last_name]"

      assert_select "input[name=?]", "user[institution_name]"

      assert_select "textarea[name=?]", "user[bio]"

      assert_select "input[name=?]", "user[course_name]"

      assert_select "input[name=?]", "user[year_started_course]"

      assert_select "input[name=?]", "user[expected_graduation_year]"

      assert_select "textarea[name=?]", "user[interests]"
    end
  end
end
