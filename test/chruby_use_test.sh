. ./test/helper.sh

function setUp()
{
	chruby_use $TEST_RUBY_ROOT >/dev/null
}

function test_chruby_use()
{
	assertEquals "invalid RUBY_ROOT"    "$TEST_RUBY_ROOT" "$RUBY_ROOT"
	assertEquals "invalid RUBY_ENGINE"  "$TEST_RUBY_ENGINE" "$RUBY_ENGINE"
	assertEquals "invalid RUBY_VERSION" "$TEST_RUBY_VERSION" "$RUBY_VERSION"
	assertEquals "invalid GEM_ROOT"     "$TEST_RUBY_ROOT/lib/ruby/gems/$TEST_RUBY_API" "$GEM_ROOT"
	assertEquals "invalid GEM_HOME"     "$TEST_GEM_HOME" "$GEM_HOME"
	assertEquals "invalid GEM_PATH"     "$GEM_HOME:$GEM_ROOT" "$GEM_PATH"
	assertEquals "invalid PATH"         "$TEST_GEM_HOME/bin:$TEST_GEM_ROOT/bin:$TEST_RUBY_ROOT/bin:$__shunit_tmpDir:$TEST_PATH" "$PATH"

	assertEquals "could not find ruby in $PATH" \
		     "$TEST_RUBY_ROOT/bin/ruby" \
		     "$(command -v ruby)"
}

function tearDown()
{
	chruby_reset
}

SHUNIT_PARENT=$0 . $SHUNIT2
