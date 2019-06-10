class ImageDataSerializer
  include FastJsonapi::ObjectSerializer

  attributes :width, :height
end
