require 'rails_helper'

RSpec.describe "resumes/show", type: :view do
  before(:each) do
    @resume = assign(:resume, Resume.create!(
      :student => nil,
      :profile_picture => "Profile Picture",
      :full_name => "Full Name",
      :tagline => "Tagline",
      :phone_number => "Phone Number",
      :physical_address => "Physical Address",
      :email_address => "Email Adress",
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
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(//)
    expect(rendered).to match(/Profile Picture/)
    expect(rendered).to match(/Full Name/)
    expect(rendered).to match(/Tagline/)
    expect(rendered).to match(/Phone Number/)
    expect(rendered).to match(/Physical Address/)
    expect(rendered).to match(/Email Adress/)
    expect(rendered).to match(/Work Experience/)
    expect(rendered).to match(/Education/)
    expect(rendered).to match(/Certifications/)
    expect(rendered).to match(/Skills/)
    expect(rendered).to match(/Languages/)
    expect(rendered).to match(/Past Projects/)
    expect(rendered).to match(/Workshops/)
    expect(rendered).to match(/Volunteerships/)
    expect(rendered).to match(/Relevant Links/)
    expect(rendered).to match(/Extra Columns/)
  end
end
