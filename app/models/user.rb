require 'mime/types'

class User < ActiveRecord::Base
    attr_accessible :mp3


  has_attached_file :mp3 #, 

    # :styles => {:mp3 => {:format => :mp3}},
    # :storage => :s3,
    # :s3_credentials => {
    #     :bucket => 'kasmp3',
    #     :access_key_id => ENV['S3_KEY'],
    #     :secret_access_key => ENV['S3_SECRET']
    #     },
    # :path => "/:style/:id/:filename"



  # validates_attachment_presence :mp3
  # validates_attachment_size :mp3,:less_than => 150.megabytes,:message => 'filesize must be less than 150 MegaBytes'
  # validates_attachment_content_type :mp3, :content_type => 
  # [ 'application/mp3', 'application/x-mp3', 'audio/mpeg', 'audio/mp3' ],:message => 'file must be of filetype .mp3'
  # validates_presence_of :title


  # def set_mime_type(data)
  #   data.content_type = MIME::Types.type_for(data.original_filename).to_s
  #   self.mp3 = data
  # end
  

  def self.from_omniauth(auth)
    where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end


end

