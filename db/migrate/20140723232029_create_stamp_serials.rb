class CreateStampSerials < ActiveRecord::Migration
  def change
    create_table :stamp_serials do |t|

      t.timestamps
    end
  end
end
