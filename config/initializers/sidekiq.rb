Sidekiq.configure_server do |config|
  config.server_middleware do |chain|
    require_relative '../../lib/job_metrics_middleware'
    chain.add JobMetricsMiddleware
  end
end

Sidekiq.configure_client do |config|
  # default
end
