class Employee

  attr_accessor :first_name, :surname, :age, :job_desc, :employee_numb

  def initialize
    @first_name = ''
    @surname = ''
    @age = ''
    @job_desc = ''
    @employee_numb = ''
  end

  def get_string
    gets.chomp
  end

  def enter_first_name
    p 'Please enter the first name of the employee'
    @first_name = get_string
  end

  def enter_surname
    p 'Please enter the surname of the employee'
    @surname = get_string
  end

  def enter_age
    p 'Please enter the age of the employee'
    @age = get_string.to_i
  end

  def enter_job
    p "Please enter the employee's job?"
    @job_desc = get_string
  end

  def employee_numb
    #need to find a way to counter any duplicate employee numbers
    time = Time.new
    @employee_numb = time.nsec
  end

  def employee_details
    @employee_details = "Employee created - #{@first_name} #{@surname} (#{@job_desc}) - Employee number = #{employee_numb}"
    p @employee_details
  end

  def data_entry
    data_entry = "#{@first_name} #{surname} - #{@employee_numb} (#{@job_desc})"
    File.open('EmployeeDatabase.txt', 'a+') { |file| file.puts(data_entry + "\n") }
  end

  def end_of_input
    #Build fail safe
    p 'Do you want to add another employee? Yes or No?'
    answer = get_string
    if (answer.start_with? 'Y') || (answer.start_with? 'y')
      new_employee = Employee.new
      new_employee.enter_first_name
      new_employee.enter_surname
      new_employee.enter_age
      new_employee.enter_job
      new_employee.employee_details
      new_employee.data_entry
      new_employee.end_of_input

    else if (answer.start_with? 'N') || (answer.start_with? 'n')
      p 'Thanks for adding a new employee'

    else
      p  'You did not put Y or N. Please try again'
      end_of_input
    end

    end
  end

  new_employee = Employee.new
  new_employee.enter_first_name
  new_employee.enter_surname
  new_employee.enter_age
  new_employee.enter_job
  new_employee.employee_details
  new_employee.data_entry
  new_employee.end_of_input

end