# http://www.ev3dev.org/docs/tutorials/using-ev3-buttons/

module Ev3dev
  class Button
    # from linux/input.h
    KEY_UP    = 103
    KEY_DOWN  = 108
    KEY_LEFT  = 105
    KEY_RIGHT = 106
    KEY_ENTER = 28
    KEY_BACK  = 14

    KEY_MAX   = 0x2ff

    def EVIOCGKEY(length)
      2 << (14+8+8) | length << (8+8) | 'E'.ord << 8 | 0x18
    end
    # end of stuff from linux/input.h

    BUF_LEN = (KEY_MAX + 7) / 8
    PATH = "/dev/input/by-path/platform-gpio-keys.0-event"

    def initialize()
      raise "couldn't find LED attributes" unless File.exist?(PATH)
      @buttons = {up: KEY_UP, down: KEY_DOWN, left: KEY_LEFT, right: KEY_RIGHT, enter: KEY_ENTER, back: KEY_BACK}
    end

    def up?
      buf = get_key_buf
      key_pressed?(KEY_UP, buf)
    end

    def down?
      buf = get_key_buf
      key_pressed?(KEY_DOWN, buf)
    end

    def left?
      buf = get_key_buf
      key_pressed?(KEY_LEFT, buf)
    end

    def right?
      buf = get_key_buf
      key_pressed?(KEY_RIGHT, buf)
    end

    def enter?
      buf = get_key_buf
      key_pressed?(KEY_ENTER, buf)
    end

    def back?
      buf = get_key_buf
      key_pressed?(KEY_BACK, buf)
    end

    def pressed
      pressed_buttons =[]
      buf = get_key_buf
      @buttons.each do |button, key_code|
        pressed_buttons << button.to_s if key_pressed?(key_code, buf)
      end
      pressed_buttons
    end

    private
    def get_key_buf
      buf = Array.new(BUF_LEN){ 0 }.pack("C*")

      File.open(PATH, 'r') do |fd|
        ret = fd.ioctl(EVIOCGKEY(buf.length), buf)
        raise "couldn't find Button attributes" if ret < 0

        buf = buf.unpack("C*")
      end
    end

    def key_pressed?(key_code, buf)
      test_bit(key_code, buf)
    end

    def test_bit(bit, bytes)
      # bit in bytes is 1 when released and 0 when pressed
      if (bytes[bit / 8] & (1 << (bit % 8))) == 0
        true   # pressed
      else
        false  # released
      end
    end
  end
end
