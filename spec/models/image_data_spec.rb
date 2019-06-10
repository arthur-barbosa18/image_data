# frozen_string_literal: true

require 'spec_helper'

describe ImageData do
  let(:image_data_instance) { build(:image_data) }

  it 'has a valid factory' do
    expect(image_data_instance).to be_valid
  end

  describe 'imagage_data' do
    describe 'pixels_count' do
      it 'is not nil?' do
        expect(ImageData.pixels_amount).not_to be_nil
      end

      it 'is greater than zero?' do
        expect(ImageData.pixels_amount).to be >= 0
      end
    end
  end
end
