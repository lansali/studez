require 'rails_helper'

RSpec.describe "resumes/edit", type: :view do
  before(:each) do
    @resume = assign(:resume, Resume.create!(
      :student => nil,
      :profile_picture => "MyString",
      :full_name => "MyString",
      :tagline => "MyString",
      :phone_number => "MyString",
      :physical_address => "MyString",
      :email_address => "MyString",
      :work_experience => "MyString",
      :education => "MyString",
      :certifications => "MyString",
      :skills => "MyString",
      :languages => "MyString",
      :past_projects => "MyString",
      :workshops => "MyString",
      :volunteerships => "MyString",
      :relevant_links => "MyString",
      :extra_columns => "MyString"
    ))
  end

  it "renders the edit resume form" do
    render

    assert_select "form[action=?][method=?]", resume_path(@resume), "post" do

      assert_select "input[name=?]", "resume[student_id]"

      assert_select "input[name=?]", "resume[profile_picture]"

      assert_select "input[name=?]", "resume[full_name]"

      assert_select "input[name=?]", "resume[tagline]"

      assert_select "input[name=?]", "resume[phone_number]"

      assert_select "input[name=?]", "resume[physical_address]"

      assert_select "input[name=?]", "resume[email_address]"

      assert_select "input[name=?]", "resume[work_experience]"

      assert_select "input[name=?]", "resume[education]"

      assert_select "input[name=?]", "resume[certifications]"

      assert_select "input[name=?]", "resume[skills]"

      assert_select "input[name=?]", "resume[languages]"

      assert_select "input[name=?]", "resume[past_projects]"

      assert_select "input[name=?]", "resume[workshops]"

      assert_select "input[name=?]", "resume[volunteerships]"

      assert_select "input[name=?]", "resume[relevant_links]"

      assert_select "input[name=?]", "resume[extra_columns]"
    end
  end
end
