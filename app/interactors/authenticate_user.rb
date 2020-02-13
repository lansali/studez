class AuthenticateUser
  include Interactor

  delegate :user, :password, to: :context

  before do
    context.fail!(error: "Invalid credentials") unless user.authenticate(password)
  end

  def call
    context.message = "Logged in successfully!"
    context.authenticated_user = user
  end
end
