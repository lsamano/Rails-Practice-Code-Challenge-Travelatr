class DestinationsController < ApplicationController
    def show
        @destination = Destination.find(params[:id])
        @posts = @destination.posts[0..4]
    end
end
