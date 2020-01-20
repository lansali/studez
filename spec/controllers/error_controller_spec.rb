require 'rails_helper'

RSpec.describe ErrorController, type: :controller do

  describe "GET #error" do
    it "returns http success" do
      get :error
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #access_denied" do
    it "returns http success" do
      get :access_denied
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #unauthorized" do
    it "returns http success" do
      get :unauthorized
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #not_found" do
    it "returns http success" do
      get :not_found
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #server_error" do
    it "returns http success" do
      get :server_error
      expect(response).to have_http_status(:success)
    end
  end

end
