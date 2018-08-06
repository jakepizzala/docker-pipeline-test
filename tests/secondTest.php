<?php

use PHPUnit\Framework\TestCase;

final class secondTest extends TestCase
{
	public function testSecondTestSuccess() {
		$this->assertTrue(true);
	}

	public function testSecondTestFail() {
		$this->assertTrue(false);
	}
}
