class ChangeCommentagainColumnName < ActiveRecord::Migration
  def change
    rename_column :comments, :ap_content, :hcs_content
  end
end