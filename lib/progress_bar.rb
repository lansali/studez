begin
    require 'io/console/size'
rescue LoadError
    # for JRuby
    require 'io/console'
end

@last_width = 0

def progress(subject, done_so_far, total)
    progress_bar = sprintf("%3d%% [%2d/%2d]  ",
                           100 * done_so_far / total,
                           done_so_far,
                           total)

    size = IO.respond_to?(:console_size) ? IO.console_size : IO.console.winsize
    terminal_width = size[1].to_i.nonzero? || 80
    max_size = terminal_width - progress_bar.size

    line = "#{progress_bar}#{subject}"
    if $stdout.tty?
      $stdout.print("\r" + (" " * @last_width) + ("\b" * @last_width) + "\r") if @last_width && @last_width > 0
      @last_width = line.size
      $stdout.print("#{line}\r")
    else
      $stdout.puts(line)
    end
    $stdout.flush
end
