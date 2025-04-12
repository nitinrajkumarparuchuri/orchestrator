require 'get_process_mem'

class JobMetricsMiddleware
  def call(worker, job, queue)
    mem = GetProcessMem.new
    before = mem.mb
    start = Time.now

    yield

    after = mem.mb
    time = Time.now - start

    Rails.logger.info("[#{worker.class.name}] used #{(after - before).round(2)}MB in #{time.round(2)}s")
  end
end
