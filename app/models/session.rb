# == Schema Information
#
# Table name: sessions
#
#  id      :integer          not null, primary key
#  user_id :integer
#  token   :string
#

class Session < ActiveRecord::Base

  belongs_to :user

  before_create :generate_token

  protected
  def generate_token
    self.token = loop do
      random_token = SecureRandom.urlsafe_base64(32)
      break random_token unless Session.exists?(token: random_token)
    end
  end
end
