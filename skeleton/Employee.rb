class Employee

  attr_reader :salary, :boss, :name 

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    @bonus = @salary * multiplier
  end

end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss, *employees)
    super(name, title, salary, boss)
    @employees = employees
  end

  def bonus(multiplier)
    total_salaries = 0
    self.employees.each { |employee| total_salaries += employee.salary }
    total_salaries * multiplier
  end

end
