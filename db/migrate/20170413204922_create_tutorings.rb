class CreateTutorings < ActiveRecord::Migration
  def change
    create_table :tutorings do |t|
      t.string :place
      t.integer :num_hours
      t.string :hour
      t.references :user, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
