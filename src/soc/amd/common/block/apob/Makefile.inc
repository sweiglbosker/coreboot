## SPDX-License-Identifier: GPL-2.0-only
ifeq ($(CONFIG_SOC_AMD_COMMON_BLOCK_APOB),y)
romstage-y += apob_cache.c
ramstage-y += apob_cache.c

endif # CONFIG_SOC_AMD_COMMON_BLOCK_APOB
