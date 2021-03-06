require 'rails_helper'

RSpec.describe "submissions/new", type: :view do
  before(:each) do
    assign(:submission, Submission.new(
      :opportunity => nil,
      :student => nil,
      :cover_letter => "MyString",
      :cv => "MyString"
    ))
  end

  it "renders new submission form" do
    render

    assert_select "form[action=?][method=?]", submissions_path, "post" do

      assert_select "input[name=?]", "submission[opportunity_id]"

      assert_select "input[name=?]", "submission[student_id]"

      assert_select "input[name=?]", "submission[cover_letter]"

      assert_select "input[name=?]", "submission[cv]"
    end
  end
end
