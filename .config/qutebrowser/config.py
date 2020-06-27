#   ___        _       ____
#  / _ \ _   _| |_ ___| __ ) _ __ _____      _____  ___ _ __
# | | | | | | | __/ _ \  _ \| '__/ _ \ \ /\ / / __|/ _ \ '__|
# | |_| | |_| | ||  __/ |_) | | | (_) \ V  V /\__ \  __/ |
#  \__\_\\__,_|\__\___|____/|_|  \___/ \_/\_/ |___/\___|_|

# Use :config-write --force --defaults, actual config starts after line 382
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}' , 'd': 'https://duckduckgo.com/?q={}', 'y': 'https://www.youtube.com/search?q={}'}
## Open base URL of the searchengine if a searchengine shortcut is invoked without parameters.
c.url.open_base_url = True
## Page(s) to open at the start.
c.url.start_pages = ['google.com']

config.bind('Y', 'hint links spawn cvlc --preferred-resolution 240 {hint-url}')
config.bind('U', 'hint links spawn cvlc --preferred-resolution 576 {hint-url}')
config.bind('I', 'hint links spawn cvlc --preferred-resolution 720 {hint-url}')

c.auto_save.session = True
c.downloads.position = 'bottom'
# c.content.images = True

c.tabs.background = True  ## Open new tabs (middleclick/ctrl+click) in the background.
c.tabs.last_close = 'close'  # Options: ignore, blank, startpage, default-page, close
c.tabs.new_position.related = 'next'

config.bind('f', 'hint')
config.bind('F', 'hint all tab-bg')
config.bind('<Ctrl-Shift-f>', 'hint --rapid links tab-bg')

# config.bind('th', 'back -t')     # opens previous visted page in a tab
# config.bind('tl', 'forward -t')  # opens forward in history page in a tab

# config.bind('<Ctrl-Shift-V>', 'enter-mode passthrough')
# config.bind('<Ctrl-Shift-V>', 'leave-mode', mode='passthrough')
config.bind('<Ctrl-i>', 'enter-mode passthrough')
config.bind('<Ctrl-i>', 'leave-mode', mode='passthrough')
config.unbind('<Ctrl-v>')  # unbind the old way of entering to passthrough mode
config.unbind('<Shift-Escape>', mode='passthrough')  # unbind the old way of leaaving to passthrough mode (needed to use vim mode in Jupyter)

config.bind('<Ctrl-h>', 'tab-prev')
config.bind('<Ctrl-l>', 'tab-next')
config.bind('<Ctrl-Shift-h>', 'tab-move -')
config.bind('<Ctrl-Shift-l>', 'tab-move +')

# ........................... used to hide the navigation and status bars
config.bind('xx', 'config-cycle statusbar.hide ;; config-cycle tabs.show always switching')
config.bind('xt', 'config-cycle tabs.show always switching')
config.bind('xb', 'config-cycle statusbar.hide')

## Automatically start playing `<video>` elements. Note: On Qt < 5.11,
c.content.autoplay = False

## Allow pdf.js to view PDF files in the browser. Note that the files can
## still be downloaded by clicking the download butn in the pdf.js viewer.
# c.content.pdfjs = False

## Editor (and arguments) to use for the `open-editor` command. The
## following placeholders are defined: * `{file}`: Filename of the file
## to be edited. * `{line}`: Line in which the caret is found in the
## text. * `{column}`: Column in which the caret is found in the text. *
## `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
## Same as `{column}`, but starting from index 0.
## Type: ShellCommand
# c.editor.command = ['nvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.editor.command = ['urxvt', '-e', 'nvim', '{}']
config.bind('ee', 'open-editor')

## Automatically enter insert mode if an editable element is focused
## after loading the page.
## Type: Bool
# c.input.insert_mode.auto_load = False

## Enable Opera-like mouse rocker gestures. This disables the context
## menu.
## Type: Bool
# c.input.rocker_gestures = False

# Auto zoom
QT_AUTO_SCREEN_SCALE_FACTOR=1.25

# Remove bold font in hints
c.fonts.hints = '11pt Consolas'

# change way of closing tabs:
config.unbind('d')
config.bind('dd', 'tab-close')
