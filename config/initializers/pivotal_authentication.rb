require 'gitpit_authentication'

Rails.configuration.middleware.use GitPit::Authentication do |manager|

  manager.default_strategies :pivotal
  manager.failure_app = GitPit::FailureApp

  class Warden::SessionSerializer

    # def serialize(record)
    #   [record.class, record.id]
    # end
    #
    # def deserialize(keys)
    #   klass, id = keys
    #   klass.find(:first, :conditions => { :id => id })
    # end

  end

  Warden::Strategies.add(:pivotal) do

    def valid?
      ( request.params["username"] && request.params["password"] ) ||
        session.has_key?("warden.user.default.key")
    end

    def authenticate!
      if token_in_session = session["warden.user.default.key"]
        PivotalTracker::Client.token = token_in_session
      else
        begin
          token = PivotalTracker::Client.token(params["username"], params["password"])
        rescue
          fail!("Could not login.")
        end
      end
      success!(token) if token
    end

  end

end