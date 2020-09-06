config.bind("gi", "hint inputs")
config.bind("<f12>", "devtools")

config.unbind("-")
config.unbind("=")
config.bind("<ctrl+=>", "zoom-in");
config.bind("<ctrl+->", "zoom-out");
config.bind("<ctrl+0>", "zoom");

config.unbind("O")
config.unbind("T")
config.unbind("th")
config.unbind("tl")
config.bind("O", "set-cmd-text :open {url:pretty}")
config.bind("T", "set-cmd-text :open -t {url:pretty}")
config.bind("t", "set-cmd-text -s :open -t")

config.unbind("<ctrl+tab>")
config.bind("<ctrl+right>", "tab-next")
config.bind("<ctrl+left>", "tab-prev")
config.bind("<ctrl+f4>", "tab-close")

config.bind("<ctrl+alt+left>", "back")
config.bind("<ctrl+alt+right>", "forward")

config.unbind("ZQ")
config.unbind("ZZ")
config.unbind("<ctrl+q>")
config.bind("<ctrl+q>", "wq")

config.unbind("q")

c.aliases = {
	"rr": "open -t https://remotedesktop.google.com",
	"gg": "open https://www.google.com/",
	"gm": "open https://www.google.com/mail",
	"na": "open https://www.naver.com/",
    "youtube": "open https://youtube.com/",
    "facebook": "open https://facebook.com/",
	"c": "tab-close",
    "w": "session-save",
    "wq": "quit --save",
	"q": "quit"
}
c.auto_save.session = True

c.colors.statusbar.url.success.https.fg = "white"

c.colors.tabs.even.bg = "silver"
c.colors.tabs.even.fg = "#666666"

c.colors.tabs.odd.bg = "gainsboro"
c.colors.tabs.odd.fg = c.colors.tabs.even.fg

c.completion.height = "20%"
c.completion.quick = False
c.completion.show = "auto"
c.completion.shrink = True

c.confirm_quit = ["downloads"]

c.content.headers.accept_language = "ko,en-US;q=0.9,en;q=0.8,ko-KR;q=0.7,la;q=0.6"
c.content.proxy = "none"
c.content.ssl_strict = True
c.content.autoplay = False

c.downloads.location.directory = "~/Downloads"
c.downloads.location.prompt = False

c.editor.command = ["alacritty", "-e", "vim '{}'"]

monospace = "14px 'D2Coding'"

c.fonts.completion.category = f"bold {monospace}"
c.fonts.completion.entry = monospace
c.fonts.debug_console = monospace
c.fonts.downloads = monospace
c.fonts.keyhint = monospace
c.fonts.messages.error = monospace
c.fonts.messages.info = monospace
c.fonts.messages.warning = monospace
c.fonts.prompts = monospace
c.fonts.statusbar = monospace

c.fonts.tabs.selected = f"bold {monospace}"
c.fonts.tabs.unselected = monospace

c.fonts.hints = f"bold {monospace}"

c.fonts.web.family.standard = "나눔고딕"
c.fonts.web.family.sans_serif = "나눔고딕"
c.fonts.web.family.fantasy = "나눔고딕"
c.fonts.web.family.serif = "나눔명조"
c.fonts.web.family.cursive = "나눔명조"
c.fonts.web.family.fixed = "D2Coding"

c.input.insert_mode.auto_leave = True
c.input.insert_mode.auto_load = True

c.scrolling.smooth = True

c.tabs.background = True
c.tabs.last_close = "close"
c.tabs.padding = {
    "left": 5,
    "right": 5,
    "top": 0,
    "bottom": 1,
}
c.tabs.select_on_remove = "prev"

c.url.default_page = "about:blank"
c.url.searchengines = {"DEFAULT": "https://www.google.com/search?q={}"}
c.url.start_pages = "https://www.naver.com/"

# The format to use for the window title. The following placeholders are
# defined:
#   * `{perc}`: The percentage as a string like `[10%]`.
#   * `{perc_raw}`: The raw percentage, e.g. `10`
#   * `{title}`: The title of the current web page
#   * `{title_sep}`: The string ` - ` if a title is set, empty otherwise.
#   * `{id}`: The internal window ID of this window.
#   * `{scroll_pos}`: The page scroll position.
#   * `{host}`: The host of the current web page.
#   * `{backend}`: Either ''webkit'' or ''webengine''
#   * `{private}` : Indicates when private mode is enabled.
c.window.title_format = "{private}{perc}{title_sep}qutebrowser"
