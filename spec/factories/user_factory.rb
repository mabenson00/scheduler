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

FactoryBot.define do
  # Base attributes for any User
  factory :user do
    email { Faker::Internet.email }
    password { "securepassword" }
    password_confirmation { password }
    phone_number { Faker::PhoneNumber.phone_number }
  end

  # Factory for Student, inheriting from User
  factory :student, parent: :user do
    type { "Student" }
  end

  # Factory for Coach, inheriting from User
  factory :coach, parent: :user do
    type { "Coach" }
  end
end
