class RequestController < ApplicationController
    def index
        @requests = Request.find(:all)
    end

    def show
		@requests = Request.find(:all)
    end

 #New Request method
    def create
    	request = Request.new
	request.urgent = params[:urgent]
	request.IssueType = params[:IssueType]
	request.ComputerName = params[:ComputerName]
	request.Subject = params[:Subject]
	request.Description = params[:Description]
        request.Status = "Open"

	if(request.save) then
    	  flash[:notice] = "The Request was successfully created."
        else
          flash[:error] = "There was an error saving the new request"
        end
	redirect_to request_index_path
    end
  
    def new
    end

    def edit
      id = params[:id]
      @request = Request.find(id)
      @updates = @request.updates
    end

    def update
      new_update = params[:UpdateText]
      @request = Request.find(params[:id])
      @request.updates.create(:UpdateText=>new_update, :Date=>DateTime.now.to_s)
      redirect_to request_index_path
    end

    def search
       @requests = Request.find(:all)
    end

    def destroy
    end

    def dashboard
    end
end
