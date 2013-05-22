class MyUploader < Carrierwave::Uploader::Base
  storage :grid_fs

  def store_dir
        "#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
  
  def default_url
      "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  end

end