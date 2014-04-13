class Challenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  def good
    self.increment :favorers_count, 1
  end

  def bad
    self.increment :favorers_count, -1
  end

  def repository_url
    @_url ||= self.user.github_authorization.find_repository(self.repository_id).html_url
  end
end
