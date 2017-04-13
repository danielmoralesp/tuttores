class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :phone
      t.string :image_url
      t.boolean :verify_bgd_check
      t.boolean :complete_exam
      t.text :about_me
      t.string :address
      t.boolean :verify_phone
      t.integer :role
      t.references :user, index: true, foreign_key: true
      t.references :city, index: true, foreign_key: true
      t.references :country, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
