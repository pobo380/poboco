class Executer
  attr_accessor :wait, :command

  def initialize(command)
    @pc = 0
    @wait = 0
    @command = command
    @delete_flag = false
  end

  def update
    while(@wait == 0)
      c = @command[@pc]
      if c.size == 2
        self.__send__ c[0], c[1]
      else
        self.__send__ c[0], *c[1..-1]
      end
      @pc += 1
      if @pc == @command.size
        @pc = 0
      end
    end
    @wait -= 1
  end

  def wait(count)
    @wait = count
  end

  def delete
    @delete_flag = true
  end

  def deleted?
    @delete_flag
  end
end

