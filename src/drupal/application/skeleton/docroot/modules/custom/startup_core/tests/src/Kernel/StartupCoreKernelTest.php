<?php

namespace Drupal\Tests\startup_core\Kernel;

use Drupal\KernelTests\KernelTestBase;

/**
 * Test Kernel test.
 *
 * @group startup
 */
class StartupCoreKernelTest extends KernelTestBase {

  /**
   * @var string[]
   */
  public static $modules = [];

  /**
   * {@inheritdoc}
   */
  public function setUp() : void {
    parent::setup();
  }

  /**
   * Test should work.
   */
  public function testShouldEqual() : void {
    $this->assertEquals('Test', 'Test');
  }

}
