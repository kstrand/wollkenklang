class SongsController < ApplicationController
  before_filter :authenticate_user!

  include AWS::S3

  def index
     @songs = AWS::S3::Bucket.find(Mp3app::Application::BUCKET).objects
  end

  def upload
    begin
        AWS::S3::S3Object.store(sanitize_filename(params[:mp3file].original_filename), params[:mp3file].read, Mp3app::Application::BUCKET, :access => :public_read)
        redirect_to root_path
    rescue
        render :text => "It didn't upload sorry : / "
    end 
  end

  def delete
    puts "hi"
  	if (params[:song])
      AWS::S3::S3Object.find(params[:song], Mp3app::Application::BUCKET).delete
			redirect_to root_path
		else
			render :text => "No song was found to delete!"
    end
  end

  private 
  def sanitize_filename(file_name)
      just_filename = File.basename(file_name)
      just_filename.sub(/[^\w\.\-]/,'_')
  end
end
