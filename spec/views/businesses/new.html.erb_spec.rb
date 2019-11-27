require 'rails_helper'

RSpec.describe "businesses/new", type: :view do
  before(:each) do
    assign(:business, Business.new(
      :employer => nil,
      :logo => "MyString",
      :description => "MyText",
      :location => "MyString"
    ))
  end

  it "renders new business form" do
    render

    assert_select "form[action=?][method=?]", businesses_path, "post" do

      assert_select "input[name=?]", "business[employer_id]"

      assert_select "input[name=?]", "business[logo]"

      assert_select "textarea[name=?]", "business[description]"

      assert_select "input[name=?]", "business[location]"
    end
  end
end
