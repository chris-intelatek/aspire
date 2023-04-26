class AddConvertedApColumntoPropspect < ActiveRecord::Migration[7.0]
  def change
    add_column :prospects, :cps_converted_ap, :decimal, default: 0.0, null: false
  end
end
