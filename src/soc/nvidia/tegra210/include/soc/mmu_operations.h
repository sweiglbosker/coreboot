/*
 * This file is part of the coreboot project.
 *
 * Copyright 2014 Google Inc.
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 2 of the License.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc.
 */

#ifndef __SOC_NVIDIA_TEGRA210_MMU_OPERATIONS_H__
#define __SOC_NVIDIA_TEGRA210_MMU_OPERATIONS_H__

void tegra210_mmu_init(void);

/* Default ttb size of 4MiB */
#define TTB_SIZE 0x4

#endif //__SOC_NVIDIA_TEGRA210_MMU_OPERATIONS_H__
