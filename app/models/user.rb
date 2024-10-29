class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable

  # Sets the default wallet amount based on admin status
  before_create :set_initial_wallet

  def set_initial_wallet
    self.wallet = admin ? 1000000 : 10000
  end
end
