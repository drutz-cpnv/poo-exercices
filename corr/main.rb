#
# Exercice Prépa Exam POO2
#
require_relative 'source_factory'
require_relative 'students_issues'
require_relative 'source_factory'
require_relative 'capital_checker'
require_relative 'part_count_checker'

issues = StudentsIssues.new
issues.add_checker(CapitalChecker.new)
issues.add_checker(PartCountChecker.new(2))

issues.run(SourceFactory.create(ARGV[0]).students)
puts issues.issues
