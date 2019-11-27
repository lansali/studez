require 'rails_helper'

RSpec.describe "employers/index", type: :view do
  before(:each) do
    assign(:employers, [
      Employer.create!(
        :user => nil,
        :bio => "MyText",
        :location => "Location"
      ),
      Employer.create!(
        :user => nil,
        :bio => "MyText",
        :location => "Location"
      )
    ])
  end

  it "renders a list of employers" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Location".to_s, :count => 2
  end
end
