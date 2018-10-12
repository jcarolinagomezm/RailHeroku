class EmployeesController < ApplicationController
    def index
        employees = Employee.all
        render json: {status: 'SUCCESS', message: 'Employees Loaded', data: employees}, status: :ok
    end

    def show
        employee = Employee.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Employee Loaded', data: employee}, status: :ok
    end

    def create
        employee = Employee.create(employee_params)
        if employee.save
            render json: {status: 'SUCCESS', message: 'Employee Created', data: employee}, status: :ok
        else
            render json: {status: 'ERROR', message: 'Employee not created', data: employee.errors}, status: :unprocessable_entity
        end
    end

    def update
        employee = Employee.find(params[:id])
        if employee.update_attributes(employee_params)
            render json: {status: 'SUCCESS', message: 'Employee Updated', data: employee}, status: :ok 
        else
            render json: {status: 'ERROR', message: 'Employee not updated', data: employee.errors}, status: :unprocessable_entity
        end
    end

    def destroy
        employee = Employee.find(params[:id])
        employee.destroy
        render json: {status: 'SUCCESS', message: 'Employee Deleted', data: employee}, status: :ok 
    end

    private
    def employee_params
        params.permit(:name, :charge, :address)
    end
end