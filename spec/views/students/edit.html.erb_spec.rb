require 'rails_helper'

RSpec.describe "students/edit", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :user => nil,
      :institution_name => "MyString",
      :bio => "MyText",
      :course_name => "MyString",
      :interests => "MyText"
    ))
  end

  it "renders the edit student form" do
    render

    assert_select "form[action=?][method=?]", student_path(@student), "post" do

      assert_select "input[name=?]", "student[user_id]"

      assert_select "input[name=?]", "student[institution_name]"

      assert_select "textarea[name=?]", "student[bio]"

      assert_select "input[name=?]", "student[course_name]"

      assert_select "textarea[name=?]", "student[interests]"
    end
  end
end
