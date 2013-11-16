all: create-script-folder modules

include ../../build/modules.mk

MODULE = event
MODULARIZE_OPTIONS = -jq

modules:
	make event/drag
	make event/drop
	# make event/linger
	# make event/wheel

event/%:
	make init-event/$* pre-event/$* post-event/$* 

init-event/%:
	$(eval MODULE = event/$*)
	$(eval SOURCE_SCRIPT_FOLDER = event.$*)
	$(eval SOURCE_SCRIPT_FILE_NAME = event.$*)

pre-event/%:
	@@echo

post-event/%: modularize-script minify-script
	@@echo