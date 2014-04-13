class Authorization < ActiveRecord::Base
  belongs_to :user

  validates :provider, :uid, :access_token, presence: true
  validates :provider, uniqueness: { scope: :user_id }
  validates :uid, uniqueness: { scope: :provider }

  class<< self
    def find_by_provider_and_uid(provider, uid)
      where(provider: provider, uid: uid.to_s).first
    end
  end
end
