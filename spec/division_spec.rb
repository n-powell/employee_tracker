
require('spec_helper')

describe(Division) do
  describe('#employees') do
    it('tells which employees are in it') do
      test_division = Division.create({:division => "HR"})
      test_employee_1 = Employee.create({:name => "Joe", :division_id => test_division.id})
      test_employee_2 = Employee.create({:name => "Jim", :division_id => test_division.id})
      expect(test_division.employees).to eq([test_employee_1, test_employee_2])
    end
  end
end
