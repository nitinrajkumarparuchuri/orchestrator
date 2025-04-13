class HeavyMemoryJob < ApplicationJob
  include MemorySimulator
  queue_as :default

  def perform
    simulate_memory(300) # very heavy
    Rails.logger.info("✅ HeavyMemoryJob done")
  end
end
