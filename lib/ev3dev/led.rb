module Ev3dev
  class Led < Device
    attr :paths

    PATH  = "/sys/class/leds"

    GREEN = [255,   0]
    RED   = [  0, 255]
    AMBER = [255, 255]

    MAX_BRIGHTNESS     = 255

    def initialize()
      raise "couldn't find LED attributes" unless File.exist?(PATH)

      @left_green   = set_led_path("left" , "green")
      @left_red     = set_led_path("left" , "red"  )
      @right_green  = set_led_path("right", "green")
      @right_red    = set_led_path("right", "red"  )

      @default_paths  = [@left_green, @left_red, @right_green, @right_red]
      @left_paths     = [@left_green, @left_red]
      @right_paths    = [@right_green, @right_red]

      @paths = @default_paths
    end

    def left()
      @paths = @left_paths
      self
    end

    def right()
      @paths = @right_paths
      self
    end

    def left_green()
      @paths = [@left_green]
      self
    end

    def left_red()
      @paths = [@left_red]
      self
    end

    def right_green()
      @paths = [@right_green]
      self
    end

    def right_red()
      @paths = [@right_red]
      self
    end

    def on(*args)
      args = args.flatten
      args = [MAX_BRIGHTNESS, MAX_BRIGHTNESS] if args.empty?
      set_each_trigger_brightness(@paths, "none", args)

      @paths = @default_paths
    end

    def off()
      self.on(0, 0)
    end

    def blink(*args)
      args = args.flatten
      args = [MAX_BRIGHTNESS, MAX_BRIGHTNESS] if args.empty?
      set_each_trigger_brightness(@paths, "timer", args)

      if args.size == 3
        if @paths.size == 1
          @paths.each do |path|
            brightness = args[0]
            next if brightness == 0

            delay_on_time  = args[1]
            delay_off_time = args[2]

            write_value_with_check(path, "delay_on" , delay_on_time)
            write_value_with_check(path, "delay_off", delay_off_time)
          end
        else
          raise "ArgumentError: wrong number of arguments (3 for 4)"
        end
      end

      if args.size == 4
        @paths.each_with_index do |path, index|
          brightness = args[index % 2]
          next if brightness == 0

          delay_on_time  = args[2]
          delay_off_time = args[3]

          write_value_with_check(path, "delay_on" , delay_on_time)
          write_value_with_check(path, "delay_off", delay_off_time)
        end
      end

      @paths = @default_paths
    end

    def set_flash(duration_time = 10)
      raise "couldn't specify the left/right green/red LED" if @paths.size != 1
      path = @paths[0]
      write_value_to_file(path, "brightness", 0)
      write_value_to_file(path, "trigger"   , "transient")
      write_value_with_check(path, "duration" , duration_time)
      write_value_with_check(path, "state"    , 1)

      @paths = @default_paths
    end

    def flash()
      raise "couldn't specify the left/right green/red LED" if @paths.size != 1
      path = @paths[0]
      write_value_to_file(path, "activate", 1)

      @paths = @default_paths
    end

    def method_missing(name, *args, &block)
      raise "couldn't specify the left/right green/red LED" if @paths.size != 1
      @device_path = @paths[0]

      super
    end


    private
    def set_led_path(side, color)
      path_array = Dir.glob(["#{PATH}/*#{side}*#{color}*", "#{PATH}/*#{color}*#{side}*"],
                             File::FNM_CASEFOLD)
      if path_array.size == 1
        path_array.first
      else
        raise "no such LED attribute: #{side} #{color}"
      end
    end

    def set_each_trigger_brightness(led_paths, trigger_mode, *led_brightness)
      led_brightness = led_brightness.flatten
      raise "ArgumentError: no led_brightness" if led_brightness.empty?

      led_paths.each_with_index do |path, index|
        brightness = led_brightness[index % 2]
        brightness = MAX_BRIGHTNESS if brightness > MAX_BRIGHTNESS

        write_value_to_file(path, "trigger"   , trigger_mode)
        write_value_to_file(path, "brightness", brightness)
      end
    end

    def write_value_to_file(path, attribute, value)
      file_path = File.join path, attribute
      raise "no such LED attribute: #{file_path}" unless File.exist? file_path
      IO.write file_path, value
    end

    # sysfs group permissions created too late - Issue #225 - ev3dev/ev3dev
    # https://github.com/ev3dev/ev3dev/issues/225
    def write_value_with_check(path, attribute, value)
      file_path = File.join path, attribute
      raise "no such LED attribute: #{file_path}" unless File.exist? file_path

      wait_counter = 0
      until File.writable? file_path
        sleep 0.05
        wait_counter += 1
        raise "writable timeout: #{file_path}" if wait_counter > 20
      end
      IO.write file_path, value
    end
  end
end


