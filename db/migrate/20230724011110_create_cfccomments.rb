class CreateCfccomments < ActiveRecord::Migration[7.0]
  def change
    create_table :cfccomments do |t|
      t.string :content
      t.references :cfcuser, foreign_key: true
      t.references :cfcpost, null: false, foreign_key: true

      t.timestamps
    end
  end
end
