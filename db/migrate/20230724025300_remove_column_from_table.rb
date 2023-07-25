class RemoveColumnFromTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :cfcreactions, :reaction_type
  end
end
