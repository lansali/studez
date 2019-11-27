require 'rails_helper'

RSpec.describe "comments/new", type: :view do
  before(:each) do
    assign(:comment, Comment.new(
      :post => nil,
      :user => nil,
      :comment => "MyText",
      :flagged => "9.99"
    ))
  end

  it "renders new comment form" do
    render

    assert_select "form[action=?][method=?]", comments_path, "post" do

      assert_select "input[name=?]", "comment[post_id]"

      assert_select "input[name=?]", "comment[user_id]"

      assert_select "textarea[name=?]", "comment[comment]"

      assert_select "input[name=?]", "comment[flagged]"
    end
  end
end
