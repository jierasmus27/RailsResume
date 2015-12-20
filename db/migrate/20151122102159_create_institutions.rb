class CreateInstitutions < ActiveRecord::Migration
  def change
    create_table :institutions do |t|
      t.string :name, index: true
      t.text :description
      t.string :image
      t.references :institution, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
