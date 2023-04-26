class AddColumnsToComment < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :ap_content, :text
  end
end
