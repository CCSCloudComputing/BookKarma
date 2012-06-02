class RequestsController < ApplicationController

def create
        @requests = Request.new(params[:requests])
        @owner = User.find_by_id(@request.user_id)
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

end
