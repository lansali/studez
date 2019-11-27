require 'rails_helper'

RSpec.describe "submissions/edit", type: :view do
  before(:each) do
    @submission = assign(:submission, Submission.create!(
      :opportunity => nil,
      :student => nil,
      :cover_letter => "MyString",
      :cv => "MyString"
    ))
  end

  it "renders the edit submission form" do
    render

    assert_select "form[action=?][method=?]", submission_path(@submission), "post" do

      assert_select "input[name=?]", "submission[opportunity_id]"

      assert_select "input[name=?]", "submission[student_id]"

      assert_select "input[name=?]", "submission[cover_letter]"

      assert_select "input[name=?]", "submission[cv]"
    end
  end
end
