VERSION := 0.1.0
APP_NAME := OpenTTY
BUNDLE_ID := com.github.hikaruegashira.opentty
APP_DIR := $(HOME)/Applications/$(APP_NAME).app
LSREGISTER := /System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister

.PHONY: build install uninstall set-defaults clean

build:
	@mkdir -p dist/$(APP_NAME).app/Contents/MacOS
	@mkdir -p dist/$(APP_NAME).app/Contents/Resources
	@sed 's/VERSION/$(VERSION)/g' src/Info.plist > dist/$(APP_NAME).app/Contents/Info.plist
	@cp src/opentty dist/$(APP_NAME).app/Contents/MacOS/$(APP_NAME)
	@chmod +x dist/$(APP_NAME).app/Contents/MacOS/$(APP_NAME)
	@echo "Built dist/$(APP_NAME).app"

install: build
	@mkdir -p $(HOME)/Applications
	@rm -rf "$(APP_DIR)"
	@cp -R dist/$(APP_NAME).app "$(APP_DIR)"
	@$(LSREGISTER) -f "$(APP_DIR)"
	@mkdir -p "$(HOME)/.config/opentty"
	@test -f "$(HOME)/.config/opentty/config" || cp src/config.default "$(HOME)/.config/opentty/config"
	@echo "Installed $(APP_DIR)"
	@$(MAKE) set-defaults

set-defaults:
	@echo "Setting OpenTTY as default handler..."
	@while IFS= read -r uti; do \
		[ -z "$$uti" ] && continue; \
		duti -s $(BUNDLE_ID) "$$uti" all 2>/dev/null || true; \
	done < src/default-utis.txt
	@echo "Done. Verify with: duti -x txt"

uninstall:
	@rm -rf "$(APP_DIR)"
	@$(LSREGISTER) -u "$(APP_DIR)" 2>/dev/null || true
	@echo "Uninstalled. Reset defaults manually if needed."

clean:
	@rm -rf dist
