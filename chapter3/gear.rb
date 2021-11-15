class Gear
	# attr_reader :chainring, :cog, :rim, :tire
	attr_reader :chainring, :cog, :wheel

	# def initialize(chainring, cog, rim, tire)
	# def initialize(args)
	# 	args = defaults.merge(args)
	# 	# @chainring = chainring
	# 	# @cog = cog
	# 	# @wheel = Wheel.new(rim, tire)
	# 	# @rim = rim
	# 	# @tire = tire
	# 	@chainring = args[:chainring]
	# 	@cog = args[:cog]
	# 	@wheel = args[:wheel]
	# end

	def initialize(args)
		@chainring = args.fetch(:chainring, 40)
		@cog = args.fetch(:cog, 18)
		@wheel = args[:wheel]
	end

	def ratio
		chainring / cog.to_f
	end

	def gear_inches
		# ratio * wheel.diameter
		foo = some_intermediate_result * diameter
		puts foo
	end

	def diameter
		wheel.diameter
	end

	def wheel
		@wheel ||= Wheel.new(rim, tire)
	end

	def defaults
		{:chainring => 40, :cog => 18}
	end
end

class Wheel
	attr_reader :rim, :tire

	def initialize(rim, tire)
		@rim = rim
		@tire = tire
	end

	def diameter
		rim + (tire * 2)
	end

	def circumference
		diameter * Math::PI
	end
end

# puts Gear.new(52, 11, 26, 1.5).gear_inches

# Gearはdiameterを知るWheelを要求する
puts Gear.new(52, 11, Wheel.new(26, 1.5)).gear_inches

Gear.new(
	:chainring => 52,
	:cog       => 11,
	:wheel     => Wheel.new(26, 1.5)
).gear_inches
