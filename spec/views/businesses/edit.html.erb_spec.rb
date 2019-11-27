require 'rails_helper'

RSpec.describe "businesses/edit", type: :view do
  before(:each) do
    @business = assign(:business, Business.create!(
      :employer => nil,
      :logo => "MyString",
      :description => "MyText",
      :location => "MyString"
    ))
  end

  it "renders the edit business form" do
    render

    assert_select "form[action=?][method=?]", business_path(@business), "post" do

      assert_select "input[name=?]", "business[employer_id]"

      assert_select "input[name=?]", "business[logo]"

      assert_select "textarea[name=?]", "business[description]"

      assert_select "input[name=?]", "business[location]"
    end
  end
end
