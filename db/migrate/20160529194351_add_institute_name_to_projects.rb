class AddInstituteNameToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :institute_name, :string
  end
end
