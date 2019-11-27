require 'rails_helper'

RSpec.describe "students/new", type: :view do
  before(:each) do
    assign(:student, Student.new(
      :user => nil,
      :institution_name => "MyString",
      :bio => "MyText",
      :course_name => "MyString",
      :interests => "MyText"
    ))
  end

  it "renders new student form" do
    render

    assert_select "form[action=?][method=?]", students_path, "post" do

      assert_select "input[name=?]", "student[user_id]"

      assert_select "input[name=?]", "student[institution_name]"

      assert_select "textarea[name=?]", "student[bio]"

      assert_select "input[name=?]", "student[course_name]"

      assert_select "textarea[name=?]", "student[interests]"
    end
  end
end
