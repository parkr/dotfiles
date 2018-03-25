SLACK_HACKS_FILE=/Applications/Slack.app/Contents/Resources/app.asar.unpacked/src/static/ssb-interop.js

all: slack-hacks

slack-hacks:
	sudo chmod 644 $(SLACK_HACKS_FILE)
	grep openark/custom-slack-css $(SLACK_HACKS_FILE) || \
		curl -s https://raw.githubusercontent.com/openark/custom-slack-css/master/slack-hack.js | sudo tee -a $(SLACK_HACKS_FILE)
