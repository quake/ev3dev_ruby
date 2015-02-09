module Ev3dev
  class Device
    attr :device_path

    def initialize(device_path)
      @device_path = device_path
    end

    def method_missing(name, *args, &block)
      raise "no device connected" if @device_path.nil?
      param = File.join @device_path, name.to_s
      raise "no such attribute: #{param}" unless File.exist? param
      if args.first.nil?
        IO.read(param).strip
      else
        IO.write param, args.first.to_s
      end
    end
  end
end