class CreateUsersStudyGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :users_study_groups, id: false do |t|
      t.references :user
      t.references :study_group
    end
  end

end
