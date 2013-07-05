HISTORYFILE="/Users/igawa/var/pythonhistory"
try:
  import rlcompleter, readline
  readline.parse_and_bind("tab: complete")
  # When you don't want to install GNU Readline, you need to comment out the
  # above line, and enable below line.
  #readline.parse_and_bind ("bind ^I rl_complete")
  readline.parse_and_bind("set input-meta on")
  readline.parse_and_bind("set convert-meta off")
  readline.parse_and_bind("set output-meta on")
  try:
    f = open(HISTORYFILE, "a")
    f.close()
    readline.read_history_file(HISTORYFILE)
  except IOError:
    pass
  try:
    import atexit
    atexit.register(lambda: readline.write_history_file(HISTORYFILE))
  except:
    pass
except:
  pass
