require 'rails_helper'

RSpec.describe "submissions/index", type: :view do
  before(:each) do
    assign(:submissions, [
      Submission.create!(
        :opportunity => nil,
        :student => nil,
        :cover_letter => "Cover Letter",
        :cv => "Cv"
      ),
      Submission.create!(
        :opportunity => nil,
        :student => nil,
        :cover_letter => "Cover Letter",
        :cv => "Cv"
      )
    ])
  end

  it "renders a list of submissions" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Cover Letter".to_s, :count => 2
    assert_select "tr>td", :text => "Cv".to_s, :count => 2
  end
end
