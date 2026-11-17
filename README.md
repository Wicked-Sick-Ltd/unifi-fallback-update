# unifi-fallback-update

This is a script I wrote to help me adjust the fallback IP of my Unifi Devices, after they have been updated.  Helpfully, Unifi erases any changes to udhcp when they perform an update, so if you wish to change the fallback IP, then you have to do it all over again.  

Edit the script IPs to match your devices.  It assumes you are running it with a valid SSH key loaded that will work on all of the devices (you can set that up in Unifi Settings --> Advanced).

## Cloud agent environment

Cursor Cloud Agents run `bash .cursor/install.sh` from `.cursor/environment.json`. The environment is validation-only: it installs shellcheck so agents can syntax-check scripts. It does not contact a UniFi controller, device, or other network host, and it does not run SSH or firmware actions. Device updates need an SSH agent (`SSH_AUTH_SOCK`). Install warns by that name when it is unset and still succeeds.

<!-- repository-guidance:begin -->
## Contributing and agent guidance

- [Contributor guide](CONTRIBUTING.md): development workflow and validation.
- [Agent instructions](AGENTS.md): shared guidance for Codex and other coding agents.
- [Security policy](SECURITY.md): private vulnerability reporting.

## Repository license

MIT licensed; see [LICENSE](LICENSE). Preserve third-party notices.
<!-- repository-guidance:end -->
