class ImageUploader < CarrierWave::Uploader::Base
	include CarrierWave::MiniMagick
	storage :fog

	version :large do
		process resize_to_limit: [800, 800]
	end

	version :medium, :from_version => :large do
		process resize_to_limit: [500, 500]
	end

	version :thumb, :from_version => :medium do
		process resize_to_fit: [100, 100]
	end

	version :square do
		process :resize_to_limit => [300, 300]
	end

	def extension_whitelist
		%w(jpg jpeg gif png)
	end

	def store_dir
		"uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
	end

end
