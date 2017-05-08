require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require './lib/employee'
require './lib/division'
require 'pry'
also_reload('lib/**/*.rb')


get('/') do
  @all_employees = Employee.all
  @all_divisions = Division.all
  erb(:index)
end

get('/employee/add') do
  erb(:add_employee_form)
end

post('/employee/add') do
  name = params.fetch('employee')
  Employee.create({:name => name})
  @all_divisions = Division.all
  @all_employees = Employee.all
  erb(:index)
end

get('/division/add') do
  erb(:add_division_form)
end

post('/division/add') do
  division = params.fetch('division-name')
  Division.create({:division => division})
  @all_divisions = Division.all
  @all_employees = Employee.all
  erb(:index)
end

get('/division/:id') do
  @employees = Employee.all
  @division = Division.find(params.fetch('id').to_i)
  erb(:division)
end

patch('/division/:id/employee') do
  @all_employees = Employee.all
  @all_divisions = Division.all
  @employee = params['employee'].to_i
  @division = Division.find(params.fetch('id').to_i)
  current_employee = Employee.find(@employee)
  current_employee.update(division_id: @division.id)
  erb(:index)
end

delete('/division/:id/delete') do
  @division = Division.find(params.fetch('id').to_i)
  @division.delete
  redirect('/')
end

patch('/division/:id/update') do
  @division = Division.find(params.fetch('id').to_i)
  name = params.fetch("division_name")
  @division.update({:division => name})
  redirect('/')
end
# get('/divisions/:id/edit') do
#   @division = Division.find(params.fetch("id").to_i())
#   erb(:division_edit)
# end
#
# patch("/divisions/:id") do
#   division = params.fetch("division")
#   @division = Division.find(params.fetch("id").to_i())
#   @division.update({:division => division})
#   @divisions = Division.all()
#   erb(:output)
# end
