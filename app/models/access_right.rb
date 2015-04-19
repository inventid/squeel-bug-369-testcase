# == Schema Information
#
# Table name: access_rights
#
#  id              :integer          not null, primary key
#  accessible_id   :integer
#  accessible_type :string
#  user_id         :integer
#

class AccessRight < ActiveRecord::Base

  belongs_to :accessible, polymorphic: true
  belongs_to :user

  validates :accessible, presence: true
  validates :user, presence: true, uniqueness: {scope: [:accessible_id, :accessible_type]}

end
