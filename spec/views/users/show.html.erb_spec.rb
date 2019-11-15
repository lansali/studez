require 'rails_helper'

RSpec.describe "users/show", type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Middle Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Institution Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Course Name/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(/9.99/)
    expect(rendered).to match(//)
  end
end
