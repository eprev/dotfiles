# Changelog

### master
- add link to the wiki page for "first pane/window issue" to the README as well
  as other tweaks

### v1.5.0, 2014-11-09
- add support for restoring neovim sessions

### v1.4.0, 2014-10-25
- plugin now uses strategies when fetching pane full command. Implemented
  'default' strategy.
- save command strategy: 'pgrep'. It's here only if fallback is needed.
- save command strategy: 'gdb'
- rename default strategy name to 'ps'
- create `expect` script that can fully restore tmux environment
- fix default save command strategy `ps` command flags. Flags are different for
  FreeBSD.
- add bash history saving and restoring (@rburny)
- preserving layout of zoomed windows across restores (@Azrael3000)

### v1.3.0, 2014-09-20
- remove dependency on `pgrep` command. Use `ps` for fetching process names.

### v1.2.1, 2014-09-02
- tweak 'new_pane' creation strategy to fix #36
- when running multiple tmux server and for a large number of panes (120 +) when
  doing a restore, some panes might not be created. When that is the case also
  don't restore programs for those panes.

### v1.2.0, 2014-09-01
- new feature: inline strategies when restoring a program

### v1.1.0, 2014-08-31
- bugfix: sourcing `variables.sh` file in save script
- add `Ctrl` key mappings, deprecate `Alt` keys mappings.

### v1.0.0, 2014-08-30
- show spinner during the save process
- add screencast script
- make default program running list even more conservative

### v0.4.0, 2014-08-29
- change plugin name to `tmux-resurrect`. Change all the variable names.

### v0.3.0, 2014-08-29
- bugfix: when top is running the pane `$PWD` can't be saved. This was causing
  issues during the restore and is now fixed.
- restoring sessions multiple times messes up the whole environment - new panes
  are all around. This is now fixed - pane restorations are now idempotent.
- if pane exists from before session restore - do not restore the process within
  it. This makes the restoration process even more idempotent.
- more panes within a window can now be restored
- restore window zoom state

### v0.2.0, 2014-08-29
- bugfix: with vim 'session' strategy, if the session file does not exist - make
  sure vim does not contain `-S` flag
- enable restoring programs with arguments (e.g. "rails console") and also
  processes that contain program name
- improve `irb` restore strategy

### v0.1.0, 2014-08-28
- refactor checking if saved tmux session exists
- spinner while tmux sessions are restored

### v0.0.5, 2014-08-28
- restore pane processes
- user option for disabling pane process restoring
- enable whitelisting processes that will be restored
- expand readme with configuration options
- enable command strategies; enable restoring vim sessions
- update readme: explain restoring vim sessions

### v0.0.4, 2014-08-26
- restore pane layout for each window
- bugfix: correct pane ordering in a window

### v0.0.3, 2014-08-26
- save and restore current and alternate session
- fix a bug with non-existing window names
- restore active pane for each window that has multiple panes
- restore active and alternate window for each session

### v0.0.2, 2014-08-26
- saving a new session does not remove the previous one
- make the directory where sessions are stored configurable
- support only Tmux v1.9 or greater
- display a nice error message if saved session file does not exist
- added README

### v0.0.1, 2014-08-26
- started a project
- basic saving and restoring works
