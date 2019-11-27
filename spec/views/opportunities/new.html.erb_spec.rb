require 'rails_helper'

RSpec.describe "opportunities/new", type: :view do
  before(:each) do
    assign(:opportunity, Opportunity.new(
      :name => "MyString",
      :business => nil,
      :description => "MyText",
      :requirements => "MyText",
      :other => "MyText",
      :category => "MyString"
    ))
  end

  it "renders new opportunity form" do
    render

    assert_select "form[action=?][method=?]", opportunities_path, "post" do

      assert_select "input[name=?]", "opportunity[name]"

      assert_select "input[name=?]", "opportunity[business_id]"

      assert_select "textarea[name=?]", "opportunity[description]"

      assert_select "textarea[name=?]", "opportunity[requirements]"

      assert_select "textarea[name=?]", "opportunity[other]"

      assert_select "input[name=?]", "opportunity[category]"
    end
  end
end
