class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.datetime :created_at
      t.string   :name
      t.string   :description
      t.integer  :overall_rating
    end
  end
end
