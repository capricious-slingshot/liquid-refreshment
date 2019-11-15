class CreateOpinions < ActiveRecord::Migration
  def change
    create_table :opinions do |t|
      t.datetime :created_at
      t.integer  :user_id
      t.integer  :beer_id
      t.integer  :user_rating
      t.string   :tasting_notes
    end
  end
end
