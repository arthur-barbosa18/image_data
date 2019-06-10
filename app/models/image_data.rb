# frozen_string_literal: true

class ImageData < ApplicationRecord
  acts_as_paranoid
  validates_as_paranoid
  has_paper_trail


  def self.write_file(resultado)
    File.open('app/views/arquivo.json', 'a+') do |i|
      i.puts JSON(resultado)
    end
  end

  def self.get_data_image(width, height)
    image_size = ImageSize.path('app/views/WhyPython.jpeg')
    data = {width: image_size.width, height: image_size.height}
    resultado = []
    data.each do |key,value|
      resultado.push(key: value) if key.to_s == width or key.to_s == height
    end
    self.write_file(resultado)
    'https://pixel.datalivemarketing.com.br/api/pixel/107?t=pageview&dl=https%3A%2F%2Fwww.cea.com.br%2F&dt=C%26A%20-%20Moda%20Feminina%2C%20Masculina%20e%20Infantil&sr=1865x1053&vp=1218x981&cid=471788232.1545210889&cd1=69d0e080-bc39-4fd5-89ff-f4b6a3ed6410&cd2=1549456447504.ipfwksm7&cd3=2019-02-06T10%3A34%3A07.504-02%3A00&cd4=null&cd5=undefined&cd6=Home&cd7=null&cm1=undefined&cm2=undefined'
  end

  def self.pixels_amount()
    File.open('app/views/arquivo.json', 'r').readlines().size
  end
end

# == Schema Information
#
# Table name: image_data
#
#  id         :bigint(8)        not null, primary key
#  deleted_at :datetime
#  height     :decimal(10, )
#  width      :decimal(10, )
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_image_data_on_deleted_at  (deleted_at)
#
