<?php

declare(strict_types = 1);

use Magento\Framework\Component\ComponentRegistrar;

ComponentRegistrar::register(ComponentRegistrar::MODULE, '%{{M2_VENDOR}}%_%{{M2_VENDOR_MODULE}}%', __DIR__);
