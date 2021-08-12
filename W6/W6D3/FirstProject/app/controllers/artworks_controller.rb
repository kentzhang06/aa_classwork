class ArtworksController < ApplicationController

    def index
        @artworks = Artwork.all
        render json: @artworks
    end

    def show
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            render json: @artwork
        else
            render json: {error: 'Artwork not found'}
        end
    end

    def create
        @artwork = Artwork.new(artwork_params)
        if @artwork.save
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def update
        @artwork = Artwork.find_by(id: params[:id])
        unless @artwork
            render json: {error: 'Artwork not found'}
            return
        end

        if @artwork.update(artwork_params)
            redirect_to artwork_url(@artwork)
        else
            render json: @artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        @artwork = Artwork.find_by(id: params[:id])
        if @artwork
            @artwork.destroy
            render json: @artwork
        else
            render json: @artwork.errors.full_messages, status: 404
        end
    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
