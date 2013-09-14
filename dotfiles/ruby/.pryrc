def main
  use_awesome_print
  use_hirb
end

def use_awesome_print
    require 'awesome_print'
    AwesomePrint.pry!
  rescue LoadError
    puts 'no awesome_print'
end

def use_hirb
  # https://github.com/pry/pry/wiki/FAQ
  begin
    require 'hirb'
  rescue LoadError
    puts 'no hirb'
  end

  if defined? Hirb
    Hirb::View.instance_eval do
      def enable_output_method
        @output_method = true
        @old_print = Pry.config.print
        Pry.config.print = proc do |output, value|
          Hirb::View.view_or_page_output(value) ||
            @old_print.call(output, value)
        end
      end

      def disable_output_method
        Pry.config.print = @old_print
        @output_method = nil
      end
    end

    Hirb.enable
    extend Hirb::Console
  end
end

main
