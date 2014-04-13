class ChallengesController < ApplicationController
  prepend_before_action :authenticate_user!
  before_action :set_subject
  before_action :set_challenge, except: [:create]

  after_action only: [:good, :bad] do
    cookies[@challenge.id.to_s] = true
  end

  def good
    @challenge.good
    redirect_to @subject
  end

  def bad
    @challenge.bad

    redirect_to @subject
  end

  def create
    @subject.challenge current_user
    redirect_to @subject
  end

  private

  def set_subject
    @subject = Subject.find(params[:subject_id])
  end

  def set_challenge
    @challenge = @subject.challenges.find(params[:id])
  end
end
