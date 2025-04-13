class EmailJob < ApplicationJob
  include MemorySimulator
  queue_as :default

  def perform
    simulate_memory(30) # light
    Rails.logger.info("✅ EmailJob done")
  end
end
