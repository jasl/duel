module Oauthable
  extend ActiveSupport::Concern

  included do
    has_many :authorizations
    devise :omniauthable
  end

  module ClassMethods
    def build_by_oauth(info)
      u = new email: info.delete(:email), password: Digest::MD5.hexdigest(Time.now.to_s)
      u.authorizations.build info
      u
    end

    def create_by_oauth(info)
      build_by_oauth(info).tap { |u| u.save }
    end

    def create_by_oauth!(info)
      build_by_oauth(info).tap { |u| u.save! }
    end
  end
end
