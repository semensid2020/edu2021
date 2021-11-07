class CreateStudyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :study_groups do |t|
      t.string  :name, unique: true
      t.integer :predmet_id
      t.integer :teacher_id
      t.timestamps
    end
  end

end
