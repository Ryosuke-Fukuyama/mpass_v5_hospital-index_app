class CreateHospitals < ActiveRecord::Migration[6.1]
  def change
    create_table :hospitals do |t|
      t.string :name
      t.string :access
      t.string :url

      t.timestamps
    end
  end
end
