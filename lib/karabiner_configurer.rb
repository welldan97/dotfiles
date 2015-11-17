module KarabinerConfigurer
  class << self

    KEYS = [
      'private.command_shift_c_to_open_chrome',
      'private.c_n_c_p_c_f_and_c_b',
      'private.c_g',
      'private.c_d',
      'private.c_h_and_m_h',
      'private.c_a_and_c_e',
      'private.c_v_and_m_v',
      'private.c_y_m_w_and_c_w',
      'private.c_s',
      'private.disable_hiding_on_cmd_h',
      'private.hold_cmd_q_to_quit',
      'private.return_to_fn'
    ]

    KARABINER_PATH = '/Applications/Karabiner.app/Contents/Library/bin/karabiner'

    def exec
      print "Configuring karabiner\n"
      KEYS.each do |k|
        result = `#{karabiner} set #{k} 1`
        print '.'
      end
      print "\n"
    end

    def karabiner
      KARABINER_PATH
    end
  end
end
