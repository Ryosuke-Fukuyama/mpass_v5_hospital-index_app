class CreateHospitalLabelings < ActiveRecord::Migration[6.1]
  def change
    create_table :hospital_labelings do |t|
      t.references :hospital, null: false, foreign_key: true
      t.references :hospital_label, null: false, foreign_key: true

      t.timestamps
    end
  end
end
