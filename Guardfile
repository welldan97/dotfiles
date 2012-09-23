ignore(/\/?\.\#/)

guard 'shell' do
  watch(/.*/) { |_| `rake copy_dotfiles` }
  watch(/^bin\/.*/) { |_| `rake copy_binaries` }
  watch(/\.hs$/) { |_| `rake restart_xmonad` }
end
