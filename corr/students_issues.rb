class StudentsIssues
  attr_reader :issues
  
  def initialize
    @issues = []
    @checkers = []
  end
  
  def add_checker(checker)
    @checkers << checker
  end
  
  def run(students)
    @checkers.each {|checker| @issues.concat(checker.check(students)) }
  end
end
