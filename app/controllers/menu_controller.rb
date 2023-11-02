class MenuController < ApplicationController
    def login
    end

    def show #shows the menu item clicked on
        session[:customer]
        @food = Food.find(params[:id])
    end

    def orderingMenu #Grabs value from previous page and Adds logged in customer information to the session
        session[:customer] = Customer.find_by(first_name: session[:firstName],phone_number: session[:phoneNumber])
        @viewableMenu = params[:value]
        @lunchAndDinnerMenu = Food.where(isBreakfast: false)
        @breakfastMenu = Food.where(isBreakfast: true)
    end

    def confirmation
        @customers_temp_orders = TempOrder.where(customer_id: session[:customer]["id"])
        puts @customers_temp_orders
    end

    def order
        @temp_order = TempOrder.new
        @temp_orders = TempOrder.all

        @foods = Food.all
        session[:customer] = Customer.find_by(first_name: session[:firstName],phone_number: session[:phoneNumber])
        puts session[:customer]
        @customers_temp_orders = TempOrder.where(customer_id: session[:customer].id)
    end
end
