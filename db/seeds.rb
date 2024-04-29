# Clear existing data to prevent duplication
User.destroy_all
Schedule.destroy_all
Appointment.destroy_all

# Create 2 coaches
2.times do |i|
  FactoryBot.create(:coach, email: "coach#{i + 1}@example.com", password: "123456")
end

# Create 20 students
20.times do |i|
  FactoryBot.create(:student, email: "student#{i + 1}@example.com", password: "123456")
end
