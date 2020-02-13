class UserSession
  include Interactor::Organizer

  delegate :email, :password, to: :context

  organize FindUser, AuthenticateUser
end
