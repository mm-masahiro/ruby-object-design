class RevealingReferences
	attr_reader :wheels

	def initialize(data)
		@wheels = wheelify(data)
	end

	def diameters
		wheels.collect { |wheel| wheel.rim + (wheel.tire * 2)}
	end

	wheel = Struct.new(:rim, :tire)

	def wheelify(data)
		data.collect { |cell| wheel.new(cell[0], cell[1])}
	end
end
