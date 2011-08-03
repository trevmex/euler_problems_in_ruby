require 'test/unit'
Dir.glob(File.join(File.dirname(__FILE__), "tc_*.rb")) do |tc|
  require tc
end
