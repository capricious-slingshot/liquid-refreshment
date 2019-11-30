class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.datetime :created_at
      t.integer  :created_by
      t.string   :name
      t.string   :description
    end
  end
end
