class FindUser
  include Interactor

  delegate :email, to: :context

  before do
    context.fail!(error: "Email provided is incorrect") unless user.present?
  end

  def call
    context.user = user
  end

  private
  def user
    user ||= User.find_by_email(email)
  end
end
