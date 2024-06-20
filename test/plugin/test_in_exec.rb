require "helper"
require "fluent/plugin/in_exec.rb"

class ExecInputTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  test "failure" do
    flunk
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Input.new(Fluent::Plugin::ExecInput).configure(conf)
  end
end
