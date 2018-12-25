class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :title, comment: 'name of subjects' 
      t.text :body, comment: 'list of subjects'
      t.text :city, comment: 'city of event'
      t.date :date_from, comment: 'start date'
      t.date :date_to, comment: 'end date'
      t.references :user, foreign_key: true
      t.boolean :visible, default: false

      t.timestamps
    end
  end
end
