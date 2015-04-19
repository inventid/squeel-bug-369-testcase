# == Schema Information
#
# Table name: shops
#
#  id       :integer          not null, primary key
#  event_id :integer
#  name     :string
#

class Shop < ActiveRecord::Base

  scope :crewed_by, -> (user) {
    joins  { access_rights.outer }
    .where {
      (access_rights.user == user) |
      (event_id.in Event.crewed_by(user).select(:id))
    }
  }

  belongs_to :event

  has_many :access_rights, as: :accessible

  def crewed_by?(user)
    Shop.crewed_by(user).include?(self)
  end

end
