class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.integer :type_tutoring
      t.integer :academ_level
      t.integer :price_per_hour
      t.integer :min_hours
      t.string :time_anticipated
      t.references :teacher, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.references :subject, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
