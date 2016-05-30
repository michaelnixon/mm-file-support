class AddLongProjectDescToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :long_project_desc, :string
  end
end
