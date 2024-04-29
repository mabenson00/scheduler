# == Schema Information
#
# Table name: users
#
#  id                 :bigint           not null, primary key
#  email              :string           not null
#  encrypted_password :string           not null
#  phone              :string           not null
#  type               :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#
class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true

  validates :type, inclusion: { in: %w[Coach Student] }
end
