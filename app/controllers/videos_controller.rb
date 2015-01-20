class VideosController < ApplicationController

  

  def new
    @video = Video.new
  end


  def create
    @video = Video.new(video_params)
    if @video.save
        flash[:success] = 'Video Added!'
        redirect_to root_url
    else
      flash[:error]="errors in video page"
      logger.info "erros in video page"
      redirect_to home_path
    end
  end

  def video_params
    params.require(:video).permit(:link)
  end

end