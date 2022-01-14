class CoinWorker
  include Sidekiq::Worker

  def perform
    Coin.most_popular.each do |coin|

      url = URI("https://bravenewcoin.p.rapidapi.com/market-cap?assetId=#{coin.asset_id}")

      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE

      request = Net::HTTP::Get.new(url)
      request["authorization"] = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik5EVXhNRGhHT0VReE56STVOelJCTTBJM1FrUTVOa0l4TWtRd1FrSTJSalJFTVRaR1F6QTBOZyJ9.eyJpc3MiOiJodHRwczovL2F1dGguYnJhdmVuZXdjb2luLmNvbS8iLCJzdWIiOiJvQ2RRb1pvSTk2RVJFOUhZM3NRN0ptYkFDZkJmNTVSWUBjbGllbnRzIiwiYXVkIjoiaHR0cHM6Ly9hcGkuYnJhdmVuZXdjb2luLmNvbSIsImlhdCI6MTY0MTcxMTM5NCwiZXhwIjoxNjQxNzk3Nzk0LCJhenAiOiJvQ2RRb1pvSTk2RVJFOUhZM3NRN0ptYkFDZkJmNTVSWSIsInNjb3BlIjoicmVhZDppbmRleC10aWNrZXIgcmVhZDpyYW5raW5nIHJlYWQ6bXdhIHJlYWQ6Z3dhIHJlYWQ6YWdncmVnYXRlcyByZWFkOm1hcmtldCByZWFkOmFzc2V0IHJlYWQ6b2hsY3YgcmVhZDptYXJrZXQtY2FwIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.ehD45wkbZSpav_V61hGBmf-WXrXkdN8r9541SDVQMfOIFuK7eunzISW5mlKBjWD83VjOGvc7STegJvAaKujw4qhdJicHCUX-PsfgIouIOYqWK16joacl4sEcHD5oSKj3QMCVNS4zfmF6hcVLitLqYtYej7jW3cIGhn9M-ZSfwojsxbZys6JUFVvwLk1dSiNSbs-2go3VLayoD6orTJJA7RiQQHTwgPS-GeAVxN5t2bt08Mt4aCjLjm08RDTNSIl-78gONDdtbhVF_RYxjibRe1oly7Qz3jnoT_p3TmquMP2_aK0w8hlZV09x12i_19u5HALTKJklsP5RnNCWMSnOlw'
      request["x-rapidapi-host"] = 'bravenewcoin.p.rapidapi.com'
      request["x-rapidapi-key"] = '5d517a3303msh35e17d1e7eb8da2p1b130bjsn9435c76aed17'

      response = http.request(request)
      coin_json = JSON.parse(response.read_body)
  
      if coin_json.present?
          coin.price = coin_json["content"][0]["price"]
          coin.marketcap_rank = coin_json["content"][0]["marketCapRank"]
          coin.total_supply = coin_json["content"][0]["totalSupply"]
          coin.total_marketcap = coin_json["content"][0]["totalMarketCap"]
          coin.save
      end
    end
  end
end
