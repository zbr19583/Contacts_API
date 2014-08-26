# == Schema Information
#
# Table name: contacts
#
#  id         :integer          not null, primary key
#  name       :string(255)      not null
#  email      :string(255)      not null
#  user_id    :string(255)      not null
#  created_at :datetime
#  updated_at :datetime
#

class Contact < ActiveRecord::Base
  validates :name, :email, presence: true
  validates :email, uniqueness: {scope: :user_id}
  
  belongs_to :user
  
  has_many :contact_shares, dependent: :destroy
  
  has_many :shared_users, through: :contact_shares, source: :user
end

# SELECT
# *
# FROM
# contact_shares JOIN users ON (contact_shares.user_id = user.id)
# WHERE
# contact.user_id = user.id