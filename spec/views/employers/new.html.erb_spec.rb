require 'rails_helper'

RSpec.describe "employers/new", type: :view do
  before(:each) do
    assign(:employer, Employer.new(
      :user => nil,
      :bio => "MyText",
      :location => "MyString"
    ))
  end

  it "renders new employer form" do
    render

    assert_select "form[action=?][method=?]", employers_path, "post" do

      assert_select "input[name=?]", "employer[user_id]"

      assert_select "textarea[name=?]", "employer[bio]"

      assert_select "input[name=?]", "employer[location]"
    end
  end
end
