class InventorySyncJob < ApplicationJob
  include MemorySimulator
  queue_as :default

  def perform
    simulate_memory(150) # medium
    Rails.logger.info("✅ InventorySyncJob done")
  end
end
