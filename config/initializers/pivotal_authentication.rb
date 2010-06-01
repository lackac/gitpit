require 'gitpit_authentication'

Rails.configuration.middleware.use Warden::Manager do |manager|

  # sets up a warden strategy for PT
  # see http://wiki.github.com/hassox/warden/setup
  manager.default_strategies :pivotal
  manager.failure_app = GitPit::FailureApp

  Warden::Strategies.add(:pivotal) do

    def valid?
      ( request.params["username"] && request.params["password"] ) ||
        session.has_key?("warden.user.default.key")
    end

    def authenticate!
      if token_in_session = session["warden.user.default.key"]
        # sets token to be used in PT API calls from session
        PivotalTracker::Client.token = token_in_session
      else
        begin
          # requests token to be used in PT API calls
          token = PivotalTracker::Client.token(params["username"], params["password"])
        rescue
          fail!("Could not login.")
        end
      end
      success!(token) if token
    end

  end

end
