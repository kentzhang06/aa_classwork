require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries)
        @name = name
        @funding = funding
        @salaries = salaries
        @employees = []
    end

    def valid_title?(title)
        return true if @salaries.has_key?(title)
        return false
    end

    def >(startup)
        self.funding > startup.funding
    end

    def hire(employee_name, title)
        if valid_title?(title)
            @employees << Employee.new(employee_name, title)
        else
            raise "invalid title"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if @funding >= salary
            employee.pay(salary)
            @funding -= salary
        else
            raise "insufficient funds"
        end
    end

    def payday
        @employees.each { |e| pay_employee(e) }
    end

    def average_salary
        total = 0
        @employees.each do |e|
            total += @salaries[e.title]
        end

        total/(employees.length * 1.0)
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(startup)
        @funding += startup.funding
        startup.salaries.each do |k, v|
            if !@salaries.has_key?(k)
                @salaries[k] = v
            end
        end

        startup.employees.each { |employee| @employees << employee}

        startup.close
    end
end
