# Changelog

## v0.5.0

This release updates to Buildroot 2020.11.2, GCC 10.2 and OTP 23.2.4.

When migrating custom systems based, please be aware of the following important
changes:

* There's a new `getrandom` syscall that is made early in BEAM startup. This
  blocks the BEAM before `rngd` can be started to provide entropy. The
  workaround is to start `rngd` from `erlinit`. See `erlinit.config`.
* The GCC 10.2.0 toolchain has a different name that calls out "nerves" as the
  vendor and the naming is now more consistent with other toolchain providers.

* Updated dependencies
  * [nerves_system_br: bump to v1.14.4](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.14.4)
  * [Buildroot 2020.11.2](http://lists.busybox.net/pipermail/buildroot/2021-January/302574.html)
  * [Erlang/OTP 23.2.4](https://erlang.org/download/OTP-23.2.4.README)
  * [Nerves toolchains 1.4.1](https://github.com/nerves-project/toolchains/releases/tag/v1.4.1)

## v0.4.0

* Updated dependencies
  * [nerves_system_br v1.13.7](https://github.com/nerves-project/nerves_system_br/releases/tag/v1.13.7)
  * linux 5.4.81
  * Erlang 23.1.5

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
