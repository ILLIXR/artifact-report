// Copyright 2019, Collabora, Ltd.
// SPDX-License-Identifier: BSL-1.0
/*!
 * @file
 * @brief  The thing that binds all of the OpenXR driver together.
 * @author Jakob Bornecrantz <jakob@collabora.com>
 */

#include "target_lists.h"

int
xrt_prober_create(struct xrt_prober **out_xp)
{
	return xrt_prober_create_with_lists(out_xp, &target_lists);
}
