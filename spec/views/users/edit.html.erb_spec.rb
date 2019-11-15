require 'rails_helper'

RSpec.describe "users/edit", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      :email => "MyString",
      :password => "MyString",
      :first_name => "MyString",
      :middle_name => "MyString",
      :last_name => "MyString",
      :institution_name => "MyString",
      :bio => "MyText",
      :course_name => "MyString",
      :year_started_course => "9.99",
      :expected_graduation_year => "9.99",
      :interests => ""
    ))
  end

  it "renders the edit user form" do
    render

    assert_select "form[action=?][method=?]", user_path(@user), "post" do

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

      assert_select "input[name=?]", "user[interests]"
    end
  end
end
