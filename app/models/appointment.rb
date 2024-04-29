# == Schema Information
#
# Table name: appointments
#
#  id         :bigint           not null, primary key
#  end_time   :datetime         not null
#  notes      :text
#  score      :integer
#  start_time :datetime         not null
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  coach_id   :bigint           not null
#  student_id :bigint           not null
#
# Indexes
#
#  index_appointments_on_coach_id    (coach_id)
#  index_appointments_on_student_id  (student_id)
#
# Foreign Keys
#
#  fk_rails_...  (coach_id => users.id)
#  fk_rails_...  (student_id => users.id)
#
class Appointment < ApplicationRecord
  belongs_to :student, class_name: "User", optional: true
  belongs_to :coach, class_name: "User"
  validates :satisfaction_score, inclusion: { in: 1..5, message: "must be between 1 and 5" },
                                 if: :completed?
  include AASM

  aasm column: "status" do
    state :available, initial: true
    state :scheduled
    state :completed
    state :missed

    event :schedule do
      transitions from: :available, to: :scheduled
    end

    event :complete do
      transitions from: :scheduled, to: :completed
    end

    event :miss do
      transitions from: :scheduled, to: :missed
    end
  end

  validate :start_must_be_before_end_time
  validate :no_overlap, on: :create

  private

  def start_must_be_before_end_time
    errors.add(:start_time, "must be before end time") if start_time >= end_time
  end

  # Prevent overlapping appointments
  def no_overlap
    return if end_time.blank? || start_time.blank?

    overlapping = Appointment.where(coach_id:)
                             .where.not(id:)
                             .where("(start_time < ? AND end_time > ?) OR (start_time < ? AND end_time > ?)",
                                    end_time, start_time + 1.second, start_time, end_time - 1.second)
    errors.add(:base, "The appointment time overlaps with another booking") if overlapping.exists?
  end
end
