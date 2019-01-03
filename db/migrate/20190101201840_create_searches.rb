class CreateSearches < ActiveRecord::Migration[5.2]
  def change
    create_table :searches do |t|
      t.integer :user_id
      t.string :search_place
      t.string :search_subject
      t.date :search_start_beg
      t.date :search_start_end

      t.timestamps
    end
  end
end
