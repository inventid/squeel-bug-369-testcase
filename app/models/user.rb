# == Schema Information
#
# Table name: users
#
#  id            :integer          not null, primary key
#  name          :string
#  email_address :string
#

class User < ActiveRecord::Base

  has_many :access_rights

  has_many :organizations, through: :access_rights, source: :accessible, source_type: "Organization"
  has_many :events, through: :access_rights, source: :accessible, source_type: "Event"
  has_many :shops, through: :access_rights, source: :accessible, source_type: "Shop"

end
