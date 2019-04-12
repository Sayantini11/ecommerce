class AddColumnCodToProducts < ActiveRecord::Migration[5.2]
  def change
  	#add_column :table_name, :column_name, :column_type
  	add_column :products, :cod_eligible, :boolean
  	add_column :products, :image_url, :string

  end
end
