require('spec_helper')



describe(Employee) do
  describe('#division') do
    it('tells which division its in') do
      test_division = Division.create({:division => "HR"})
      test_employee_1 = Employee.create({:name => "Joe", :division_id => test_division.id})
      test_employee_2 = Employee.create({:name => "Jim", :division_id => test_division.id})
      expect(test_employee_1.division).to eq(test_division)
    end
  end
end
