import math

class DACDriver
    var hardware_volume_control
    var state
    var name
    var signedness
    var datasheet_link

    def get_gpio(pin)
        return int(self.state[pin])
    end

    def get_i2s_pins()
        var pins_config = I2SPinsConfig()
        pins_config.mck_io = 0
        pins_config.bck_io = self.get_gpio('bck')
        pins_config.ws_io = self.get_gpio('ws')
        pins_config.data_out_io = self.get_gpio('data')

        return pins_config
    end

    # initializes the DAC driver
    def init_i2s()
    end

    # disables I2S
    def unload_i2s()
    end

    # sets the volume of the DAC
    def set_volume(volume)
    end

    def make_config_form(ctx, state)
        ctx.create_group('i2s', { 'label': 'I2S GPIO' })
        ctx.create_group('i2c', { 'label': 'I2C GPIO' })
        
        ctx.number_field('bck', {
            'label': "BCK",
            'default': "0",
            'group': 'i2s',
        })

        ctx.number_field('ws', {
            'label': "WS",
            'default': "0",
            'group': 'i2s',
        })

        ctx.number_field('data', {
            'label': "DATA",
            'default': "0",
            'group': 'i2s',
        })

        ctx.number_field('mclk', {
            'label': "MCLK",
            'default': "0",
            'group': 'i2s',
        })

        ctx.number_field('sda', {
            'label': "SDA",
            'default': "0",
            'group': 'i2c',
        })

        ctx.number_field('scl', {
            'label': "SCL",
            'default': "0",
            'group': 'i2c',
        })
    end

    def bin(num)
        var res = 0
        for x : 1..size(num)
            res += math.pow(2, x-1) * int(num[size(num) - x])
        end
        return int(res)
    end    
end
