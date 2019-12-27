require 'rails_helper'

RSpec.describe InfoController, type: :controller do

  describe "GET #privacy_policy" do
    it "returns http success" do
      get :privacy_policy
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #terms_of_service" do
    it "returns http success" do
      get :terms_of_service
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #security_policy" do
    it "returns http success" do
      get :security_policy
      expect(response).to have_http_status(:success)
    end
  end

end
