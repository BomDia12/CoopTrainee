class ArtistsController < ApplicationController
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def edit
    @artist = Artist.find(params[:id])
  end

  def create
    artist = Artist.new(artist_params)
    begin
      artist.save!
      redirect_to artists_path
      flash[:alert] = 'Artista salvo com sucesso!'
    rescue StandardError => e
      flash[:alert] = e
      redirect_to new_artist_path
    end
  end

  def update
    artist = Artist.find(params[:id])
    begin
      artist.update!(artist_params)
      flash[:alert] = 'Deu tudo certo'
      redirect_to artists_path
    rescue StandardError => e
      flash[:alert] = e
      redirect_to edit_artist_path(params[:id])
    end
  end

  def destroy
    artist = Artist.find(params[:id])
    begin
      artist.destroy!
      redirect_to artists_path
      flash[:alert] = 'Deu tudo certo'
    rescue StandardError => e
      flash[:alert] = e
      redirect to artists_path
    end
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :age, :nationality)
  end
end
