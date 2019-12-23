require 'rails_helper'

RSpec.describe "resumes/index", type: :view do
  before(:each) do
    assign(:resumes, [
      Resume.create!(
        :student => nil,
        :profile_picture => "Profile Picture",
        :full_name => "Full Name",
        :tagline => "Tagline",
        :phone_number => "Phone Number",
        :physical_address => "Physical Address",
        :email_adress => "Email Adress",
        :work_experience => "Work Experience",
        :education => "Education",
        :certifications => "Certifications",
        :skills => "Skills",
        :languages => "Languages",
        :past_projects => "Past Projects",
        :workshops => "Workshops",
        :volunteerships => "Volunteerships",
        :relevant_links => "Relevant Links",
        :extra_columns => "Extra Columns"
      ),
      Resume.create!(
        :student => nil,
        :profile_picture => "Profile Picture",
        :full_name => "Full Name",
        :tagline => "Tagline",
        :phone_number => "Phone Number",
        :physical_address => "Physical Address",
        :email_adress => "Email Adress",
        :work_experience => "Work Experience",
        :education => "Education",
        :certifications => "Certifications",
        :skills => "Skills",
        :languages => "Languages",
        :past_projects => "Past Projects",
        :workshops => "Workshops",
        :volunteerships => "Volunteerships",
        :relevant_links => "Relevant Links",
        :extra_columns => "Extra Columns"
      )
    ])
  end

  it "renders a list of resumes" do
    render
    assert_select "tr>td", :text => nil.to_s, :count => 2
    assert_select "tr>td", :text => "Profile Picture".to_s, :count => 2
    assert_select "tr>td", :text => "Full Name".to_s, :count => 2
    assert_select "tr>td", :text => "Tagline".to_s, :count => 2
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    assert_select "tr>td", :text => "Physical Address".to_s, :count => 2
    assert_select "tr>td", :text => "Email Adress".to_s, :count => 2
    assert_select "tr>td", :text => "Work Experience".to_s, :count => 2
    assert_select "tr>td", :text => "Education".to_s, :count => 2
    assert_select "tr>td", :text => "Certifications".to_s, :count => 2
    assert_select "tr>td", :text => "Skills".to_s, :count => 2
    assert_select "tr>td", :text => "Languages".to_s, :count => 2
    assert_select "tr>td", :text => "Past Projects".to_s, :count => 2
    assert_select "tr>td", :text => "Workshops".to_s, :count => 2
    assert_select "tr>td", :text => "Volunteerships".to_s, :count => 2
    assert_select "tr>td", :text => "Relevant Links".to_s, :count => 2
    assert_select "tr>td", :text => "Extra Columns".to_s, :count => 2
  end
end
