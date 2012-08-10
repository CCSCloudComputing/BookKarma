class MatchesController < ApplicationController


	def new
    		@match = Match.new
	end

	def show
   		    @matches = Match.all
	end

end
