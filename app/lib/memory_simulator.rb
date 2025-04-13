# app/lib/memory_simulator.rb
module MemorySimulator
  def simulate_memory(size_in_mb)
    Rails.logger.info("Simulating #{size_in_mb}MB of memory")
    junk = Array.new(size_in_mb * 25_000) { "a" * 10 }
    sleep 2 # simulate processing time
    junk.clear
  end
end
