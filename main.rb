#
# Exercice Prépa Exam POO2
#

#
# Réusinez ce programme afin que:
#  1. Le fonctionnement depuis l'extérieur de change pas
#  2. On puisse facilement rajouter une "source" de donnée (autre que http et fichier)
#  3. On puisse facilement rajouter un "check"

source = ARGV[0]

if source.start_with?('http://')
  require 'net/http'
  students = Net::HTTP.get(URI(source)).split("\n").map {|line| line.chomp.split(' ') }
elsif File.exist?(source)
  students = File.readlines(source).map {|line| line.chomp.split(' ') }
end

# By default run all the checks
issues = []

# check that each name part starts with a capital
students.each do |student_parts|
  issues << "#{student_parts.first} doesn't start with a capital" if student_parts.first !~ /^[A-Z]/
  issues << "#{student_parts.last} doesn't start with a capital" if student_parts.last !~ /^[A-Z]/
end

# check that we don't have more the 2 parts
students.each do |student_parts|
  issues << "#{student_parts.join(' ')} has #{student_parts.size} parts, only 2 allowed" unless student_parts.size == 2
end

puts issues
