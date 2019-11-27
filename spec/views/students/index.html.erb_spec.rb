require 'rails_helper'

RSpec.describe "students/index", type: :view do
  before(:each) do
    assign(:students, [
      Student.create!(
        :user => nil,
        :institution_name => "Institution Name",
        :bio => "MyText",
        :course_name => "Course Name",
        :interests => "MyText"
      ),
      Student.create!(
        :user => nil,
        :institution_name => "Institution Name",
        :bio => "MyText",
        :course_name => "Course Name",
        :interests => "MyText"
      )
    ])
  end

  it "renders a list of students" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Institution Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Course Name".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
