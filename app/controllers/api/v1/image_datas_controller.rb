# frozen_string_literal: true

module Api
  module V1
    class ImageDatasController < ApiController

      def get_data
        link = ImageData.get_data_image(params[:width], params[:height])
        if link
        send_data open(link)
        else
          render_unprocessable(link)
        end
      end

      def pixels_count
        amount_pixels = ImageData.pixels_amount()
        if amount_pixels
          render json: {Quantidade: amount_pixels}
        else
          render_unprocessable({Quantidade: amount_pixels})
        end
      end
    end
  end
end
