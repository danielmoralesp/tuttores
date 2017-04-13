class CreateExperiences < ActiveRecord::Migration
  def change
    create_table :experiences do |t|
      t.string :cargo
      t.string :empresa
      t.string :mes_inicio
      t.string :dia_inicio
      t.string :mes_fin
      t.string :dia_fin
      t.string :ubicacion
      t.text :description
      t.references :teacher, index: true, foreign_key: true
      t.string :ano_inicio
      t.string :ano_fin

      t.timestamps null: false
    end
  end
end
