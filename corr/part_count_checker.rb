class PartCountChecker
  def initialize(part_count)
    @part_count = part_count
  end
  
  def check(students)
    issues = []
    # check that we don't have more the 2 parts
    students.each do |student_parts|
      issues << "#{student_parts.join(' ')} has #{student_parts.size} parts, only #{@part_count} allowed" unless student_parts.size == @part_count
    end
    issues
  end
end
