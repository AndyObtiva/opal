class IO
  SEEK_SET = 0
  SEEK_CUR = 1
  SEEK_END = 2

  attr_accessor :write_proc

  def write(string)
    `self.write_proc(string)`
    string.size
  end

  module Writable
    def <<(string)
      write(string)

      self
    end

    def print(*args)
      write args.map { |arg| String(arg) }.join($,)
      nil
    end

    def puts(*args)
      newline = $/
      write args.map { |arg| String(arg) }.join(newline)+newline
      nil
    end
  end

  module Readable
    def readbyte
      getbyte
    end

    def readchar
      getc
    end

    def readline(sep = $/)
      raise NotImplementedError
    end

    def readpartial(integer, outbuf = nil)
      raise NotImplementedError
    end
  end
end

STDERR = $stderr = IO.new
STDIN  = $stdin  = IO.new
STDOUT = $stdout = IO.new

$stdout.write_proc = -> (string) {`console.log(#{string.to_s});`}
$stderr.write_proc = -> (string) {`console.warn(#{string.to_s});`}

$stdout.extend(IO::Writable)
$stderr.extend(IO::Writable)
