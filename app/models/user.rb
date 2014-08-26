# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#  username   :string(255)
#

class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  
  has_many :contacts, dependent: :destroy
  has_many :contact_shares, dependent: :destroy
  
  has_many :shared_contacts, through: :contact_shares, source: :contact
end

# SELECT
# contact.*
# FROM
# contact_shares JOIN contacts ON (contact.id = contact_shares.contact_id)
# WHERE
# contact.user_id = ?
# {id, 2}