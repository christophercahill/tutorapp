class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.references :user, index: true, foreign_key: true
      t.text :biography
      t.string :school
      t.string :year
      t.string :major
      t.string :name

      t.timestamps null: false
    end
  end
end
