class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  include Oauthable

  has_many :subjects
  has_many :challenges

  def github_authorization
    authorizations.where(provider: 'github').first
  end
end
