class AddAssignedToNotes < ActiveRecord::Migration
  def change
    add_column :notes, :assigned, :string
  end
end
