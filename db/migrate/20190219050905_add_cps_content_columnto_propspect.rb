class AddCpsContentColumntoPropspect < ActiveRecord::Migration
  def change
    add_column :comments, :cps_content, :text
  end
end