class RequestsController < ApplicationController

def create
 #       @request = Request.create(params[:request])
	@request = Request.new(params[:request]) 
        @owner = @request.user
        @owner.requests << @request
        respond_to do |format|
      if @request.save
        format.html { redirect_to @request, notice: 'User was successfully created.' }
        format.json { render json: @request, status: :created, location: @request }
      else
        format.html { render action: "new" }
        format.json { render json: @request.errors, status: :unprocessable_entity }
      end
    end
end

def new
        @request = Request.new
end

def show
        @request = Request.all
        @owner = Request.find_by_id(params[:id]).user
end

end

