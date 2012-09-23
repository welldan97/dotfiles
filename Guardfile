ignore(/\/?\.\#/)

guard 'shell' do
  watch(/.*/) { |_| `rake copy_dotfiles` }
  watch(/^bin\/.*/) { |_| `sudo rake copy_binaries` }
  watch(/\.hs$/) { |_| `rake restart_xmonad` }
  watch(/cron\/.crontab/) { |_| `rake set_crontab` }
end
