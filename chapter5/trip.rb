class Trip
	attr_reader :bicycles, :customers, :vehicle

	def prepare(prepares)
		prepares.each {|prepare|
			case prepare
			when Mechanic
				preparer.prepare_bicycles(bicycles)
			when TripCoordinator
				preparer.buy_food(customers)
			when Driver
				preparer.gas_up(vehicle)
				preparer.fill_water_tank(vehicle)
			end
		}
	end
end

class TripCoordinator
	def buy_food(customers)
		return
	end
end

class Driver
	def gas_up(vehicle)
		return
	end
end

class Mechanic
	def prepare_bicycles(bicycles)
		bicycles.each { |bicycle| prepare_bicycle(bicycle) }
	end

	def prepare_bicycle(bicycle)
		return
	end
end
