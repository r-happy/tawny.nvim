.PHONY: generate-companion-themes generate-preview check

generate-companion-themes:
	XDG_STATE_HOME=/tmp nvim --headless -u NORC -i NONE "+set rtp^=." "+luafile scripts/generate_companion_themes.lua" "+qa"

generate-preview:
	XDG_STATE_HOME=/tmp nvim --headless -u NORC -i NONE "+set rtp^=." "+luafile scripts/generate_preview.lua" "+qa"

check:
	XDG_STATE_HOME=/tmp nvim --headless -u NONE -i NONE --cmd "set rtp^=." -l tests/companion_themes.lua
