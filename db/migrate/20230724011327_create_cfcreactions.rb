class CreateCfcreactions < ActiveRecord::Migration[7.0]
  def change
    create_table :cfcreactions do |t|
      t.string :kind
      t.string :reaction_type
      t.references :cfcuser, null: false, foreign_key: true
      t.references :cfcpost, foreign_key: true

      t.timestamps
    end
  end
end
