class AddPrimrayKeyToCollaborators < ActiveRecord::Migration[5.2]
  def change
    add_column :collaborators, :id, :primary_key
  end
end
