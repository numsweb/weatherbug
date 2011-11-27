class CreateWeatherItems < ActiveRecord::Migration
  def change
    create_table :weather_items do |t|
      t.string :name
      t.string :zip_code
      t.timestamps
    end
  end
end
