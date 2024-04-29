class CreateAppointments < ActiveRecord::Migration[7.1]
  def change
    create_table :appointments do |t|
      t.references :student, null: false, foreign_key: { to_table: :users }
      t.references :coach, null: false, foreign_key: { to_table: :users }
      t.integer :score
      t.text :notes
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false
      t.string :status

      t.timestamps
    end
  end
end
