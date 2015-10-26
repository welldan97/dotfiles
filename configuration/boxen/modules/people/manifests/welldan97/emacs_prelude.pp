class people::welldan97::emacs_prelude {
  repository { "${people::welldan97::config::home}/.emacs.d":
    source => "bbatsov/prelude"
  }
}
