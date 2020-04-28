require 'logger'
logger = Logger.new(STDERR)
logger = Logger.new(STDOUT)
logger.level = Logger::WARN