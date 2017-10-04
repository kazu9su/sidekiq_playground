# frozen_string_literal: true
require 'sidekiq'

Sidekiq.configure_client do |config|
  config.redis = { db: 1 }
end

Sidekiq.configure_server do |config|
  config.redis = { db: 1 }
end

class OurWorker
  include Sidekiq::Worker

  def perform(complexity)
    case complexity
    when "super_hard"
      sleep 3
      puts 'Super hard'
    when 'hard'
      sleep 2
      puts 'hard'
    else
      sleep 1
      puts 'not hard'
    end
  end
end