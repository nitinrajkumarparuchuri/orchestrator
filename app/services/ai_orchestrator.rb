class AiOrchestrator
  def self.pick_and_enqueue_job
    job_pool = [
      { name: "EmailJob", cost: 30 },
      { name: "InventorySyncJob", cost: 150 },
      { name: "FraudCheckJob", cost: 250 }
    ]


    current = GetProcessMem.new.mb
    allowed = [500 - current, 0].max # Ensure allowed memory is never negative

    Rails.logger.info("🤖 AI found no safe job to run (available: #{allowed.round(2)}MB)") if allowed < 50

    if allowed > 0
      # Proceed with job selection and allocation
      job = job_pool.find { |j| j[:cost] < allowed }
    else
      Rails.logger.warn("🤖 No memory available to run jobs.")
    end
    

    if job
      job_class = job[:name].constantize
      job_class.perform_later
      Rails.logger.info("🤖 AI chose #{job[:name]} (available: #{allowed.round(2)}MB)")
    else
      Rails.logger.warn("🤖 AI found no safe job to run (available: #{allowed.round(2)}MB)")
    end
  end
end
