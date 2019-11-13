class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :apellido
      t.string :nombre
      t.string :cel
      t.boolean :activo

      t.timestamps
    end
  end
end
