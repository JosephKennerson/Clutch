class SearchController < ApplicationController

  def search
    if params[:q].nil?
      @events = []
    else
      @events = Event.search params[:q]
    end
  end

# def search_params
#       params.require(:search).permit(:q)
#     end

end
