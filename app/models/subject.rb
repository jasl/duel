class Subject < ActiveRecord::Base
  belongs_to :user

  has_many :challenges

  before_validation do
    self.accept_token ||= SecureRandom.hex
  end

  validates :title, :objective, :accept_token, presence: true
  validates :accept_token, uniqueness: true
end
