class Authorization < ActiveRecord::Base
  belongs_to :user

  validates :provider, :uid, :access_token, presence: true
  validates :provider, uniqueness: { scope: :user_id }
  validates :uid, uniqueness: { scope: :provider }

  after_find :mount_api_handler
  attr_reader :handler

  class<< self
    def find_by_provider_and_uid(provider, uid)
      where(provider: provider, uid: uid.to_s).first
    end
  end

  private

  # handler factory
  def mount_api_handler
    @handler = "#{self.provider.camelize}ApiHandler".constantize.new(self.access_token)
  end
end
