class FraudCheckJob < ApplicationJob
  include MemorySimulator
  queue_as :default

  def perform
    simulate_memory(250) # heavy
    Rails.logger.info("✅ FraudCheckJob done")
  end
end
