class CreatePredmets < ActiveRecord::Migration[6.0]
  def change
    create_table :predmets do |t|
      t.string  :name, unique: true
      t.string  :description
      t.timestamps
    end
  end
end
