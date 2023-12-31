/* SPDX-License-Identifier: GPL-2.0-only */

/* Generated by acpigen */
External (\PPKG, MethodObj)

// Thermal Zone
#include "../thermal.h"

Scope (\_TZ)
{
	ThermalZone (THRM)
	{
		Name (_TC1, 0x02)
		Name (_TC2, 0x05)

		// Thermal zone polling frequency: 0 seconds
		Name (_TZP, 0)

		// Thermal sampling period for passive cooling: 2 seconds
		Name (_TSP, 20)

		// Convert from Degrees C to 1/10 Kelvin for ACPI
		Method (CTOK, 1) {
			// 10th of Degrees C
			Local0 = Arg0 * 10

			// Convert to Kelvin
			Local0 += 2732

			Return (Local0)
		}

		// Threshold for OS to shutdown
		Method (_CRT, 0, Serialized)
		{
			Return (CTOK (\TCRT))
		}

		// Threshold for passive cooling
		Method (_PSV, 0, Serialized)
		{
			Return (CTOK (\TPSV))
		}

		// Processors used for passive cooling
		Method (_PSL, 0, Serialized)
		{
			Return (\PPKG ())
		}

		Method (_TMP, 0, Serialized)
		{
			Return (CTOK (30))
		}

		Method (_AC0) {
			If (\FLVL <= 0) {
				Return (CTOK (FAN0_THRESHOLD_OFF))
			} Else {
				Return (CTOK (FAN0_THRESHOLD_ON))
			}
		}

		Method (_AC1) {
			If (\FLVL <= 1) {
				Return (CTOK (FAN1_THRESHOLD_OFF))
			} Else {
				Return (CTOK (FAN1_THRESHOLD_ON))
			}
		}

		Method (_AC2) {
			If (\FLVL <= 2) {
				Return (CTOK (FAN2_THRESHOLD_OFF))
			} Else {
				Return (CTOK (FAN2_THRESHOLD_ON))
			}
		}

		Method (_AC3) {
			If (\FLVL <= 3) {
				Return (CTOK (FAN3_THRESHOLD_OFF))
			} Else {
				Return (CTOK (FAN3_THRESHOLD_ON))
			}
		}

		Method (_AC4) {
			If (\FLVL <= 4) {
				Return (CTOK (FAN4_THRESHOLD_OFF))
			} Else {
				Return (CTOK (FAN4_THRESHOLD_ON))
			}
		}

		Name (_AL0, Package () { FAN0 })
		Name (_AL1, Package () { FAN1 })
		Name (_AL2, Package () { FAN2 })
		Name (_AL3, Package () { FAN3 })
		Name (_AL4, Package () { FAN4 })

		PowerResource (FNP0, 0, 0)
		{
			Method (_STA) {
				If (\FLVL <= 0) {
					Return (1)
				} Else {
					Return (0)
				}
			}
			Method (_ON)  {
				\FLVL = 0
				Notify (\_TZ.THRM, 0x81)
			}
			Method (_OFF) {
				\FLVL = 1
				Notify (\_TZ.THRM, 0x81)
			}
		}

		PowerResource (FNP1, 0, 0)
		{
			Method (_STA) {
				If (\FLVL <= 1) {
					Return (1)
				} Else {
					Return (0)
				}
			}
			Method (_ON)  {
				\FLVL = 1
				Notify (\_TZ.THRM, 0x81)
			}
			Method (_OFF) {
				\FLVL = 2
				Notify (\_TZ.THRM, 0x81)
			}
		}

		PowerResource (FNP2, 0, 0)
		{
			Method (_STA) {
				If (\FLVL <= 2) {
					Return (1)
				} Else {
					Return (0)
				}
			}
			Method (_ON)  {
				\FLVL = 2
				Notify (\_TZ.THRM, 0x81)
			}
			Method (_OFF) {
				\FLVL = 3
				Notify (\_TZ.THRM, 0x81)
			}
		}

		PowerResource (FNP3, 0, 0)
		{
			Method (_STA) {
				If (\FLVL <= 3) {
					Return (1)
				} Else {
					Return (0)
				}
			}
			Method (_ON)  {
				\FLVL = 3
				Notify (\_TZ.THRM, 0x81)
			}
			Method (_OFF) {
				\FLVL = 4
				Notify (\_TZ.THRM, 0x81)
			}
		}

		PowerResource (FNP4, 0, 0)
		{
			Method (_STA) {
				If (\FLVL <= 4) {
					Return (1)
				} Else {
					Return (0)
				}
			}
			Method (_ON)  {
				\FLVL = 4
				Notify (\_TZ.THRM, 0x81)
			}
			Method (_OFF) {
				\FLVL = 4
				Notify (\_TZ.THRM, 0x81)
			}
		}

		Device (FAN0)
		{
			Name (_HID, EISAID ("PNP0C0B"))
			Name (_UID, 0)
			Name (_PR0, Package () { FNP0 })
		}

		Device (FAN1)
		{
			Name (_HID, EISAID ("PNP0C0B"))
			Name (_UID, 1)
			Name (_PR0, Package () { FNP1 })
		}

		Device (FAN2)
		{
			Name (_HID, EISAID ("PNP0C0B"))
			Name (_UID, 2)
			Name (_PR0, Package () { FNP2 })
		}

		Device (FAN3)
		{
			Name (_HID, EISAID ("PNP0C0B"))
			Name (_UID, 3)
			Name (_PR0, Package () { FNP3 })
		}

		Device (FAN4)
		{
			Name (_HID, EISAID ("PNP0C0B"))
			Name (_UID, 4)
			Name (_PR0, Package () { FNP4 })
		}
	}
}
