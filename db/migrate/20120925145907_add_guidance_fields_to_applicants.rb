class AddGuidanceFieldsToApplicants < ActiveRecord::Migration
  def change
    add_column :applicants, :schoolphone, :string
    add_column :applicants, :counselorname, :string
    add_column :applicants, :dueto, :string
    add_column :applicants, :datedue, :date
  end
end
