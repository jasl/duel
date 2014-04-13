module SubjectsHelper
  def can_vote?(c)
    !cookies[c.id.to_s]
  end

  def can_challenge?(subject, user)
    @_current_user_repository ||= subject.challenges.where(user_id: user.id).first
    !@_current_user_repository
  end

  def current_user_repository(subject, user)
    @_current_user_repository ||= subject.challenges.where(user_id: user.id).first
  end
end
