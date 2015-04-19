# == Schema Information
#
# Table name: organizations
#
#  id   :integer          not null, primary key
#  name :string
#

class Organization < ActiveRecord::Base
  has_many :access_rights, as: :accessible

  has_many :events
  has_many :shops, through: :events

  scope :crewed_by, -> (user) { joins { access_rights.outer }
                                  .where { access_rights.user == user }
  }

  def crewed_by?(user)
    Organization.crewed_by(user).include?(self)
  end

end
