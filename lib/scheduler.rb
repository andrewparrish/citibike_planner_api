require 'rufus-scheduler'
require 'singleton'

class Scheduler
  include Singleton

  def self.get_scheduler
    create_scheduler
  end

  def self.add_event(occurence, service_class)
    get_scheduler.scheduler.every occurence do
      Resque.enqueue(service_class)
    end
  end

  def scheduler
    @scheduler
  end

  private

  def initialize
    @scheduler = Rufus::Scheduler.new
  end

  def self.create_scheduler
    new()
  end
end
