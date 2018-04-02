class SearchesController < ApplicationController
  def search
  end

  def foursquare
    @resp = Faraday.get 'https://api.foursquare.com/v2/venues/search' do |req|
        req.params['client_id'] = 'Y1U4TDWGE4EUZ35KUCSGNRP3IRFA5X32URM5EOFEBXPSSSFW'
        req.params['client_secret'] = 'B1IRM1SYF53UJKU4CICVMUTY0ZTP3BL1FZCBPVNLAHG5DZC2'
        req.params['v'] = '20160201'
        req.params['near'] = params[:zipcode]
        req.params['query'] = 'coffee shop'
    end
    body_hash = JSON.parse(@resp.body)
    @venues = body_hash["response"]["venues"]
    render 'search'
    end
end
