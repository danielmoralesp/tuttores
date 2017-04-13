class CreateTests < ActiveRecord::Migration
  def change
    create_table :tests do |t|
      t.text :questions
      t.text :answers
      t.integer :result
      t.references :subject, index: true, foreign_key: true
      t.references :topic, index: true, foreign_key: true
      t.references :teacher, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
