Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    require_relative '../../lib/job_metrics_middleware'
    chain.add JobMetricsMiddleware
  end
end

Sidekiq.configure_client do |config|
  # default
end
Thread.new do
  loop do
    current = GetProcessMem.new.mb
    if current > 500
      Rails.logger.warn("⚠️ Memory exceeded: #{current.round(2)}MB")
      AiOrchestrator.pick_and_enqueue_job
    end
    sleep 5
  end
end
