watch_curl:
	@find . -name '*.go' |\
		entr zsh curl.sh

