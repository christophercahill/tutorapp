class AddLookingForToCourses < ActiveRecord::Migration
  def change
    add_column :courses, :looking_for, :boolean
  end
end
