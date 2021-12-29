class CoinApi

    def self.fetch
        Coin.destroy_all
        url = URI("https://bravenewcoin.p.rapidapi.com/asset?status=ACTIVE")

        http = Net::HTTP.new(url.host, url.port)
        http.use_ssl = true
        http.verify_mode = OpenSSL::SSL::VERIFY_NONE

        request = Net::HTTP::Get.new(url)
        request["x-rapidapi-host"] = 'bravenewcoin.p.rapidapi.com'
        request["x-rapidapi-key"] = '5d517a3303msh35e17d1e7eb8da2p1b130bjsn9435c76aed17'

        response = http.request(request)  
        coins = JSON.parse(response.read_body)
        if coins.present?
            
            coins["content"].each do |coindata|
                coinid = coindata["id"]
                coin = Coin.new(asset_id: coinid)

                url = URI("https://bravenewcoin.p.rapidapi.com/market-cap?assetId=#{coinid}")

                http = Net::HTTP.new(url.host, url.port)
                http.use_ssl = true
                http.verify_mode = OpenSSL::SSL::VERIFY_NONE

                request = Net::HTTP::Get.new(url)
                request["authorization"] = 'Bearer eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCIsImtpZCI6Ik5EVXhNRGhHT0VReE56STVOelJCTTBJM1FrUTVOa0l4TWtRd1FrSTJSalJFTVRaR1F6QTBOZyJ9.eyJpc3MiOiJodHRwczovL2F1dGguYnJhdmVuZXdjb2luLmNvbS8iLCJzdWIiOiJvQ2RRb1pvSTk2RVJFOUhZM3NRN0ptYkFDZkJmNTVSWUBjbGllbnRzIiwiYXVkIjoiaHR0cHM6Ly9hcGkuYnJhdmVuZXdjb2luLmNvbSIsImlhdCI6MTY0MDcwMDQ5NSwiZXhwIjoxNjQwNzg2ODk1LCJhenAiOiJvQ2RRb1pvSTk2RVJFOUhZM3NRN0ptYkFDZkJmNTVSWSIsInNjb3BlIjoicmVhZDppbmRleC10aWNrZXIgcmVhZDpyYW5raW5nIHJlYWQ6bXdhIHJlYWQ6Z3dhIHJlYWQ6YWdncmVnYXRlcyByZWFkOm1hcmtldCByZWFkOmFzc2V0IHJlYWQ6b2hsY3YgcmVhZDptYXJrZXQtY2FwIiwiZ3R5IjoiY2xpZW50LWNyZWRlbnRpYWxzIn0.rSMD0u6iAxAeQOAedcnz3U_eWSnLdYP_9BDOjSX59CtEaPP9tgkFvlsbJv5tbr5PgvSNpKrOIPHOi7NQoewlYD6iL1PrRUVSgUFQWzBhZWaA5hOxpabwdFhDXe_N0LPfFIa7gDsbRkfaUs__zx2TA4OUQatLIspZ1GSreQIiBK0HgYrP_YFX7EuUW0H4cGmbEAOczX6ZV3zxaMCPjyJ2XCBNRQ-Owab5TO_tcqn4JrYC1EkilM98ZEXHci1t04YnCs8Wz2c3TKSDWA1vMGcYDdwx9_0Q1wZb-4cvvjUgEEpnNNHOlTx6rA6w7BICy-7-Be2PRBnl4b0MJ7gKFxHL8A'
                request["x-rapidapi-host"] = 'bravenewcoin.p.rapidapi.com'
                request["x-rapidapi-key"] = '5d517a3303msh35e17d1e7eb8da2p1b130bjsn9435c76aed17'

                response = http.request(request)
                coin_json = JSON.parse(response.read_body)
                if coin_json.present?
                    coin.name = coindata["name"]
                    coin.ticker = coindata["symbol"]
                    coin.price = coin_json["content"][0]["price"]
                    coin.marketcap_rank = coin_json["content"][0]["marketCapRank"]
                    coin.total_supply = coin_json["content"][0]["totalSupply"]
                    coin.total_marketcap = coin_json["content"][0]["totalMarketCap"]
                    coin.save
                end
            end
        end
    end

end
# t.string "name"
# t.string "ticker"
# t.float "price", default: 0.0
# t.string "asset_id"
# t.integer "marketcap_rank"
# t.integer "total_supply"
# t.float "total_marketcap"
# t.datetime "last_updated"

# {"content"=>
#     [{"id"=>"5255343d-c64f-4ee7-80dc-60a319271aad",
#       "assetId"=>"080564c5-6721-4203-a232-c7468d6ca789",
#       "timestamp"=>"2021-12-29T00:40:00.000Z",
#       "marketCapRank"=>545,
#       "volumeRank"=>641,
#       "price"=>0.0280114419242103,
#       "volume"=>4155589.063585844,
#       "totalSupply"=>1000000000,
#       "freeFloatSupply"=>568723686,
#       "marketCap"=>15930770.501311814,
#       "totalMarketCap"=>28011441.9242103}]}