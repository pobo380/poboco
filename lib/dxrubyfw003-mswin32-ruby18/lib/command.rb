class Command
  attr_reader :command

  def initialize
    @command = []
  end

  def method_missing(m, *arg)
    @command.push([m] + arg)
  end

  def self.generate(&block)
    c = Command.new
    c.instance_eval(&block) if block
    c.command
  end
end
