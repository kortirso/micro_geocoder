# frozen_string_literal: true

require 'cgi'

describe Api::V1 do
  context 'GET /api/v1' do
    before { get '/api/v1' }

    it 'returns success status' do
      expect(last_response.status).to eq(200)
    end

    it 'and returns version of api' do
      expect(response_body['version']).to eq 'v1'
    end
  end

  context 'GET /api/v1/geocode' do
    context 'for valid city' do
      let(:city) { CGI.escape 'City 17' }

      before { get "/api/v1/geocode?city=#{city}" }

      it 'returns success status' do
        expect(last_response.status).to eq(200)
      end

      it 'and returns coordinates' do
        expect(response_body['coordinates']).to eq [45.05, 90.05]
      end
    end
  end
end
