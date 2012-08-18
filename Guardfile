guard 'shell' do
  watch(/.*/) { |_| `rake copy_dotfiles` }
  watch(/\.hs$/) { |_| `rake restart_xmonad` }
end
