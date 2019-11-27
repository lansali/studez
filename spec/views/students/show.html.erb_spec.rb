require 'rails_helper'

RSpec.describe "students/show", type: :view do
  before(:each) do
    @student = assign(:student, Student.create!(
      :user => nil,
      :institution_name => "Institution Name",
      :bio => "MyText",
      :course_name => "Course Name",
      :interests => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Institution Name/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Course Name/)
    expect(rendered).to match(/MyText/)
  end
end
