require 'rails_helper'

RSpec.describe "submissions/show", type: :view do
  before(:each) do
    @submission = assign(:submission, Submission.create!(
      :opportunity => nil,
      :student => nil,
      :cover_letter => "Cover Letter",
      :cv => "Cv"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(//)
    expect(rendered).to match(/Cover Letter/)
    expect(rendered).to match(/Cv/)
  end
end
