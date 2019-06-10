require 'swagger_helper'

describe 'Subscriptions API' do
  path '/contagem/' do
    get 'Quantidade de pixel' do
      tags 'Imagem'
      produces 'application/json'

      response '200', 'Contagem de pixel' do
        let(:Quantidade) {1}
        schema '$ref' => '#/definitions/image_data_object'
        run_test!
      end
    end
  end
end