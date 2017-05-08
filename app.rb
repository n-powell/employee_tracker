require 'sinatra'
require 'sinatra/reloader'
require("sinatra/activerecord")
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

post('/employee/add') do
  name = params.fetch('employee')
  Employee.create({:name => name})
  @all_divisions = Division.all
  @all_employees = Employee.all
  erb(:index)
end
