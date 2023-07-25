class CreateCfcposts < ActiveRecord::Migration[7.0]
  def change
    create_table :cfcposts do |t|
      t.string :image
      t.string :description
      t.references :cfcuser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
