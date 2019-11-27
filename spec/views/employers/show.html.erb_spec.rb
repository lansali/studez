require 'rails_helper'

RSpec.describe "employers/show", type: :view do
  before(:each) do
    @employer = assign(:employer, Employer.create!(
      :user => nil,
      :bio => "MyText",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Location/)
  end
end
