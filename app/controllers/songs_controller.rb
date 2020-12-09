class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def edit
    @song = Song.find(params[:id])
  end

  def create
    song = Song.new(songs_params)
    begin
      song.save!
      flash[:alert] = 'Song criada com sucesso!'
      redirect_to songs_path
    rescue StandardError => e
      flash[:alert] = e
      redirect_to new_song_path
    end
  end

  def update
    song = Song.find(params[:id])
    begin
      song.update!(songs_params)
      flash[:alert] = 'Deu tudo certo'
      redirect_to songs_path
    rescue StandardError => e
      flash[:alert] = e
      redirect_to edit_song_path(params[:id])
    end
  end

  def destroy
    song = Song.find(params[:id])
    begin
      song.destroy!
      flash[:alert] = 'Destruído com sucesso'
    rescue StandardError => e
      flash[:alert] = e
    ensure
      redirect_to songs_path
    end
  end

  private

  def songs_params
    params.require(:song).permit(:name, :releasedate, :explicit, :artist_id)
  end
end
