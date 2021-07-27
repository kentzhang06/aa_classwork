class Employee
  attr_reader :salary

  def initialize(name, title, salary, boss)
    @name = name
    @title = title
    @salary = salary
    @boss = boss
  end

  def bonus(multiplier)
    bonus = self.salary * multiplier
  end
end

class Manager < Employee
  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super
    @employees = []
  end

  def add_employees(employee)
    queue = [employee]
    @employees << employee
    until queue.empty?
      ele = queue.shift
    
      if ele.is_a?(Manager)
        ele.employees.each do |emp|
          queue.push(emp)
          
          @employees << emp
        end
      end
    end
  end

  def bonus(multiplier)
    total = @employees.inject(0) { |acc, el| acc + el.salary }
    bonus = total * multiplier
  end


end
