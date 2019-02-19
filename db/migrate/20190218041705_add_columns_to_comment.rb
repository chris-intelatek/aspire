class AddColumnsToComment < ActiveRecord::Migration
  def change
    add_column :comments, :ap_content, :text
  end
end
