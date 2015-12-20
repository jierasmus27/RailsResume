class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :name, index: true
      t.text :description
      t.string :image_url
      t.references :institution, index: true, foreign_key: true
      t.references :instructor, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
