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
        @salaries.has_key?(title)
    end

    def >(other_startup)
        self.funding > other_startup.funding
    end
    
    def hire(string, title)
        if valid_title?(title)
            @employees << Employee.new(string, title)
        else
            raise "invalid title, dummy"
        end
    end

    def size
        @employees.length
    end

    def pay_employee(employee)
        salary = @salaries[employee.title]
        if salary > @funding
            raise "not enough funding"
        else
            employee.pay(salary)
            @funding -= salary
        end
    end

    def payday
        @employees.each {|employee| self.pay_employee(employee)}
    end

    def average_salary
        sum = 0
        @employees.each { |employee| sum += @salaries[employee.title] }
        sum/@employees.length
    end

    def close
        @employees = []
        @funding  = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding
        #look at this later
        @salaries = other_startup.salaries.merge(@salaries)
        @employees += other_startup.employees
        other_startup.close
    end
end
