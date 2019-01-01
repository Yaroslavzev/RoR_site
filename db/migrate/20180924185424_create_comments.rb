class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.references :user, foreign_key: true
      t.references :event, foreign_key: true
      t.boolean :visible, default: false

      t.timestamps
    end
  end
end