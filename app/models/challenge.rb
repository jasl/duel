class Challenge < ActiveRecord::Base
  belongs_to :user
  belongs_to :subject

  def good
    increment :favorers_count, 1
    save
  end

  def bad
    increment :favorers_count, -1
    save
  end

  def repository_url
    @_url ||= self.user.github_authorization.find_repository(self.repository_id).html_url
  end
end
