# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  organization_id :integer
#  name            :string
#

class Event < ActiveRecord::Base

  scope :crewed_by, -> (user) {
    joins { access_rights.outer }
    .where {
      (access_rights.user == user) |
      (organization_id.in Organization.crewed_by(user).select(:id))
    }
  }

  belongs_to :organization

  has_many :access_rights, as: :accessible

  has_many :shops

  def crewed_by?(user)
    Event.crewed_by(user).include?(self)
  end

end

