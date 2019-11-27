require 'rails_helper'

RSpec.describe "employers/edit", type: :view do
  before(:each) do
    @employer = assign(:employer, Employer.create!(
      :user => nil,
      :bio => "MyText",
      :location => "MyString"
    ))
  end

  it "renders the edit employer form" do
    render

    assert_select "form[action=?][method=?]", employer_path(@employer), "post" do

      assert_select "input[name=?]", "employer[user_id]"

      assert_select "textarea[name=?]", "employer[bio]"

      assert_select "input[name=?]", "employer[location]"
    end
  end
end
