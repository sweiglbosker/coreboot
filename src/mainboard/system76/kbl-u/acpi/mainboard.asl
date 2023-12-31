/* SPDX-License-Identifier: GPL-2.0-only */

Scope (\_SB) {
	Scope (PCI0) {
		#include "backlight.asl"
	}

	#include "ac.asl"
	#include "battery.asl"
	#include "buttons.asl"
	#include "hid.asl"
	#include "lid.asl"
	#include "s76.asl"
	#include "sleep.asl"
}

Scope (_GPE) {
	#include "gpe.asl"
}
