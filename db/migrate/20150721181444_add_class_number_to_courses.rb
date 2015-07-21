class AddClassNumberToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :class_number, :integer
    add_column :courses, :description, :text
    add_reference :courses, :user, index: true, foreign_key: true
    add_column :courses, :title, :string
    add_column :courses, :professor, :string
    add_column :courses, :grade, :string
    add_column :courses, :price, :string
    add_column :courses, :preferred_time, :string
    add_column :courses, :preferred_people, :string
    add_reference :courses, :profile, index: true, foreign_key: true
  end
end
