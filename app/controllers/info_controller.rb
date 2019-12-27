class InfoController < ApplicationController
  skip_before_action :authenticate_request

  def privacy_policy
  end

  def terms_of_service
  end

  def security_policy
  end
end
