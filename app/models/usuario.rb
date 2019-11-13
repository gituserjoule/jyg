class Usuario < ActiveRecord::Base
    #attr_accessible :activo, :cel, :nombre, :apellido

	def self.to_csv
	  attributes = %w{ id apellido nombre cel activo updated_at }
	  CSV.generate do |csv|
		csv << attributes
		all.each do |usuario|
		  csv << usuario.attributes.values_at(*attributes)
		end
	end
end
end