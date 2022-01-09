class Coin < ApplicationRecord
    scope :most_popular, -> {where(ticker: ["BTC", "ETH", "BNB", "USDT", "SOL", "ADA", "USDC", "XRP", "HEX", "LUNA", "WETH", "AVAX", "DOGE", "SHIB", "MATIC", "BUSD", "WBTC", "UNI", "LTC", "UST", "LINK", "CRO", "ALGO", "DAI", "BCH", "NEAR", "OKB", "DOT", "XLM", "MANA"])}
end
