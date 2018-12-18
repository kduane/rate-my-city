class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :city_name, presence: true
      t.string :description, presence: true
      t.integer :rating, presence: true, default: 0

      t.timestamps
    end
  end
end
