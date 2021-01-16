class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string     :postal_code , null:false
      t.integer    :province_id , null:false
      t.string     :city        , null:false
      t.string     :address_line, null:false
      t.string     :building    
      t.string     :phone_num   , null:false
      t.references :order       , null:false,foreign_key:true
      t.timestamps
    end
  end
end
