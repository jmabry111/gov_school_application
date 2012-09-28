class CreateSchools < ActiveRecord::Migration
  def change
    create_table :schools do |t|
      t.string :name
      t.string :representative_email

      t.timestamps
      
      change_column :applicants, :school, :integer
      rename_column :applicants, :school, :school_id
    end
  end
end
