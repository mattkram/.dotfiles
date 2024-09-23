CONFIGS := alacritty nvim
CONFIG_DIR := ~/.config
CONFIG_TARGETS := $(addprefix $(CONFIG_DIR)/,$(CONFIGS))

install: $(CONFIG_DIR) $(CONFIG_TARGETS)

$(CONFIG_DIR):
	mkdir -p $@

# Create a symlink in the ~/.config dir for any matching rule
$(CONFIG_DIR)/%: $(shell pwd)/%
	ln -s $< $@
