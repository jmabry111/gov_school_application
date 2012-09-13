class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :fname
      t.string :mname
      t.string :lname
      t.string :school
      t.integer :grade
      t.string :gender
      t.string :parentfname
      t.string :parentlname
      t.string :address
      t.string :homephone
      t.string :workphone
      t.string :email
      t.string :mathteacher
      t.string :scienceteacher
      t.string :engteacher

      t.timestamps
    end
  end
end
