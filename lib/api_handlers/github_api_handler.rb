class GithubApiHandler
  attr_reader :client, :login

  def initialize(access_token)
    @client = Github.new oauth_token: access_token,
                         client_id: Rails.application.secrets.github_client_id,
                         client_secret: Rails.application.secrets.github_client_secret

    @login = @client.users.get.login
  end

  def create_repository(name, description)
    begin
      client.repos.create name: name, description: description
    rescue
      nil
    end
  end

  def fork_repository(user, name)
    begin
      client.repos.forks.create user: user, repo: name
    rescue
      nil
    end
  end
end
