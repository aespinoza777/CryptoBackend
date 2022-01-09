class CoinWorker
  include Sidekiq::Worker

  def perform(*args)
    puts "This is running!"
  end
end
