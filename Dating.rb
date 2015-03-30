#Joshua Skootsky, 2015
#Code is yours for use under the Apache 2.0 licence. See LICENCE

class Person
	def initialize(name, kashrus, shabbas, height_feet, height_inches)
		@name = name
		@kashrus = kashrus
		@shabbas = shabbas
		@height_feet = height_feet
		@height_inches = height_inches
	end

	def print()
		puts "Hello! My name is #{@name}."
		puts "On a scale of 1 to 10, I'd say kashrus is #{@kashrus} important."
		puts "Shabbas would be a #{@shabbas}."
		puts "I am #{@height_feet} feet and #{@height_inches} inches tall."
		puts ""
	end

	def getName()
		return @name
	end

	def getKashrus()
		return @kashrus
	end

	def getShabbas()
		return @shabbas
	end

	def getHeightFeet()
		return @height_feet
	end

	def getHeightInches()
		return @height_inches
	end
end

shtark = Person.new(name = 'Shtark Shmuly', kashrus='10', shabbas='9',
		height_feet='5', height_inches='6')

ben = Person.new(name = 'Ben Builder', kashrus = '4', shabbas = '5',
			height_feet='6', height_inches='2')

estee = Person.new(name = 'Estee Aidle', kashrus = '9', shabbas = '10',
			height_feet='5', height_inches='5')

shtark.print()
ben.print()
estee.print()

# Make an array of people
pool = [shtark, ben, estee]

def MatchAnalysis(person1, person2)
	# calculates two people's compatibility
	height_inches1 = person1.getHeightInches
	height_feet1 = person1.getHeightFeet
	shabbas1 = person1.getShabbas
	kashrus1 = person1.getKashrus
	name1 = person1.getName

	height_inches2 = person2.getHeightInches
    height_feet2 = person2.getHeightFeet
    shabbas2 = person2.getShabbas
    kashrus2 = person2.getKashrus
    name2 = person2.getName

	# convert strings to numbers
	match = shabbas1.to_f - shabbas2.to_f
	match = (match + kashrus1.to_f - kashrus2.to_f).abs
	return match 
end
=begin
# Commented out for demo
puts "It looks like Estee and Ben are a #{MatchAnalysis(estee, ben)}"
puts "It looks like Estee and Shmuly are a #{MatchAnalysis(estee, shtark)}"
=end

def MatchAll(person, pool)
	# requires: a person and an array of people as arguments
	# return a match for that person from the array of people
	best_match = 100
	best_match_name = ""
	pool.each do |potential|
		puts "It looks like #{person.getName} and #{potential.getName} are a #{MatchAnalysis(person, potential)} in compatibility!"
		if(MatchAnalysis(person, potential) < best_match && (person.getName != potential.getName))
			best_match = MatchAnalysis(person, potential)
			best_match_name = potential.getName
		end
	end

	puts "The best match for #{person.getName()} in the pool was #{best_match_name}"
end

puts "We will now run a match analysis on all members of our pool."
MatchAll(estee, pool)


