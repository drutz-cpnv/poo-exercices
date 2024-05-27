require 'mail'

require_relative 'logger'

class MailListener

  def initialize(logger = Logging::StdoutLogger.new, guard)
    @logger = logger
    @guard = guard
    @stats_filename = "data/stats.txt"
    @store_location = "data"

    @received_count = 0
    @rejected_count = 0
  end

  def update(mail)
    mail = Mail.read_from_string(mail)
    @logger.log "Received mail: #{mail.from} #{mail.to}"
    @received_count += 1

    validation = @guard.validate(mail)
    if validation.empty?
      @logger.log "Stored mail: #{mail.from} #{mail.to}"

      mail.to.each do |recipient|
        target_dir = File.join(@store_location, recipient)
        Dir.mkdir(target_dir) unless Dir.exist?(target_dir)
        File.write(File.join(target_dir, "#{Time.now.to_i}.eml"), mail.raw_source)
      end
    else
      @logger.log "Rejected mail: #{mail.from} #{mail.to}"
      @rejected_count += 1
    end

    File.open(@stats_filename, "w") do |file|
      file.puts "Received count: #{@received_count}"
      file.puts "Rejected count: #{@rejected_count}"
      file.puts "Spam ratio: #{@rejected_count * 100 / @received_count}%"
    end
  rescue
    # Catch any exceptions, show them, and keep alive to be able to handle upcoming mails
    STDERR.puts $!.message
    STDERR.puts $!.backtrace
  end

end
