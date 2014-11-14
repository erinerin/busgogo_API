class CreateTutorials < ActiveRecord::Migration
   def self.up
  	create_table :tutorials do |t|
	t.text :num
	t.text :station
	t.timestamps
		end
	end

	def self.down
	drop_table :tutorials
	end
end

