.PHONY: generate-companion-themes generate-preview

generate-companion-themes:
	XDG_STATE_HOME=/tmp nvim --headless -u NORC -i NONE "+set rtp^=." "+luafile scripts/generate_companion_themes.lua" "+qa"

generate-preview:
	XDG_STATE_HOME=/tmp nvim --headless -u NORC -i NONE "+set rtp^=." "+luafile scripts/generate_preview.lua" "+qa"
