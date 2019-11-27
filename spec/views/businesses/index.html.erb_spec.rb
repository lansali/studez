require 'rails_helper'

RSpec.describe "businesses/index", type: :view do
  before(:each) do
    assign(:businesses, [
      Business.create!(
        :employer => nil,
        :logo => "Logo",
        :description => "MyText",
        :location => "Location"
      ),
      Business.create!(
        :employer => nil,
        :logo => "Logo",
        :description => "MyText",
        :location => "Location"
      )
    ])
  end

  it "renders a list of businesses" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Logo".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
