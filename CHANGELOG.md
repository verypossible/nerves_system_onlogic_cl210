# Changelog

## v0.3.0

This release updates Buildroot to 2020.02 and upgrades gcc from 8.3 to 9.2.
While this is a minor version bump due to the Buildroot release update, barring
advanced usage of Nerves, this is a straightforward update from v0.2.1.

* Updated dependencies
  * [nerves_system_br v1.11.0](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.11.0)
  * linux 5.4.26
  * Erlang 22.2.8
* Enhancements
  * Enable linux kernel module for CMOS RTC. This update will continue to work
    in conjunction with `nerves_time` for clock sync.

## v0.2.1

* Enhancements
  * Enable `pppd` for cellular network interfaces.

## v0.2.0

* Enhancements
  * Enabled PPPD support for LTE modules.
  * Added package `nerves_initramfs` to support auto failback logic.
  * Update `boardid` to retreive the serial number form DMI.
  * Remove unnecessary system packages.
* Update dependencies
  * [nerves_system_br v1.10.1](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.10.1)
  * Erlang 22.2.3

## v0.1.0

Initial Release
