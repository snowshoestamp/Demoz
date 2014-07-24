class CreateDemos < ActiveRecord::Migration
  def change
    create_table :demos do |t|
      t.string :stamp_serial

      t.timestamps
    end
  end
end
