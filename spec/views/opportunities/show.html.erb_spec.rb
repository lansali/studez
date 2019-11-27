require 'rails_helper'

RSpec.describe "opportunities/show", type: :view do
  before(:each) do
    @opportunity = assign(:opportunity, Opportunity.create!(
      :name => "Name",
      :business => nil,
      :description => "MyText",
      :requirements => "MyText",
      :other => "MyText",
      :category => "Category"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(//)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/Category/)
  end
end
