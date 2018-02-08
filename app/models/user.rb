class User < ApplicationRecord
  has_many :created_events, :foreign_key => "creator_id", :class_name => "Event"
  has_many :attended_events, :through => :invitations, :class_name => "Event"
  has_many :invitations, :foreign_key => "attendee_id"
  validates :email, uniqueness: true, presence: true
  validates :password_digest, presence: true
  has_secure_password
end
