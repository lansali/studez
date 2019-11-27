require 'rails_helper'

RSpec.describe "businesses/show", type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :employer => nil,
      :logo => "Logo",
      :description => "MyText",
      :location => "Location"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Logo/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Location/)
  end
end
