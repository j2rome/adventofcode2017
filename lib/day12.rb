class Day12
  def solve(input)
    pipes = parse(input)
    search(pipes).size
  end

  def solve2(input)
    pipes = parse(input)
    search_all(pipes, 0)
  end

  def search_all(pipes, count)
    return count if pipes.empty?
    programs = []
    search(pipes, programs, pipes.keys.first)
    pipes.delete_if { |k, _| programs.include?(k) }
    search_all(pipes, count + 1)
  end

  def search(pipes, programs = [], id = 0)
    recipients_id = pipes[id]
    programs << id
    unless recipients_id.nil?
      recipients_id.each do |r_id|
        search(pipes, programs, r_id) unless programs.include?(r_id)
      end
    end
    programs
  end

  def parse(input)
    pipes = {}
    input.each_line do |line|
      m = /^(?<id>\d*)\s*<->\s*(?<recipients>.*)$/.match(line)
      pipes[m[:id].to_i] = m[:recipients].strip.split(',').map(&:to_i)
    end
    pipes
  end
end
