class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.datetime :created_at
      t.string   :name
      t.string   :description
    end
  end
end
