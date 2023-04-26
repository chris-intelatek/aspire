class AddCpsContentColumntoPropspect < ActiveRecord::Migration[7.0]
  def change
    add_column :comments, :cps_content, :text
  end
end