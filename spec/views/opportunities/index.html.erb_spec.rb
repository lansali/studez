require 'rails_helper'

RSpec.describe "opportunities/index", type: :view do
  before(:each) do
    assign(:opportunities, [
      Opportunity.create!(
        :name => "Name",
        :author => nil,
        :description => "MyText",
        :requirements => "MyText",
        :other => "MyText",
        :category => "Category"
      ),
      Opportunity.create!(
        :name => "Name",
        :author => nil,
        :description => "MyText",
        :requirements => "MyText",
        :other => "MyText",
        :category => "Category"
      )
    ])
  end

  it "renders a list of opportunities" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Category".to_s, :count => 2
  end
end
