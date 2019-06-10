# frozen_string_literal: true

FactoryBot.define do
  factory :image_data do
    height { Random.new.rand(1..500) }
    width {Random.new.rand(1..600) }
  end
end
