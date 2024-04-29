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
class Coach < User
  # Association with Appointments
  has_many :appointments, dependent: :destroy
end
