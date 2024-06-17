class CapitalChecker
  def check(students)
    issues = []
    # check that each name part starts with a capital
    students.each do |student_parts|
      issues << "#{student_parts.first} doesn't start with a capital" if student_parts.first !~ /^[A-Z]/
      issues << "#{student_parts.last} doesn't start with a capital" if student_parts.last !~ /^[A-Z]/
    end
    issues
  end
end
