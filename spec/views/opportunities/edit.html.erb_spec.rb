require 'rails_helper'

RSpec.describe "opportunities/edit", type: :view do
  before(:each) do
    @opportunity = assign(:opportunity, Opportunity.create!(
      :name => "MyString",
      :author => nil,
      :description => "MyText",
      :requirements => "MyText",
      :other => "MyText",
      :category => "MyString"
    ))
  end

  it "renders the edit opportunity form" do
    render

    assert_select "form[action=?][method=?]", opportunity_path(@opportunity), "post" do

      assert_select "input[name=?]", "opportunity[name]"

      assert_select "input[name=?]", "opportunity[author_id]"

      assert_select "textarea[name=?]", "opportunity[description]"

      assert_select "textarea[name=?]", "opportunity[requirements]"

      assert_select "textarea[name=?]", "opportunity[other]"

      assert_select "input[name=?]", "opportunity[category]"
    end
  end
end
