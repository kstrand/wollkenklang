module ApplicationHelper
	def download_url_for(song_key)
			AWS::S3::S3Object.url_for(song_key,Mp3app::Application::BUCKET, :authenticated => false)
	end

	def torrent_url_for(song_key)
			download_url_for(song_key) + "?torrent"
	end
end
