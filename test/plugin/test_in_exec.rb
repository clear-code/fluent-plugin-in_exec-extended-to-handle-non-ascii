require "helper"
require "fluent/plugin/in_exec.rb"

class ExecInputTest < Test::Unit::TestCase
  setup do
    Fluent::Test.setup
  end

  data(immediate: "")
  data(run_interval: "run_interval 1")
  test 'can handle non-ascii characters' do |additional_setting|
    content = 'ひらがな漢字'

    d = create_driver %[
      command ruby -e "puts '#{content}'"
      tag test
      encoding utf-8
      <parse>
        @type none
      </parse>
      #{additional_setting}
    ]

    d.run(expect_records: 1, timeout: 10)

    assert_equal 1, d.events.length
    tag, time, record = d.events.first
    assert_equal({"message" => content}, record)
  end

  test 'raise ConfigError for invalid encoding' do
    assert_raise Fluent::ConfigError do
      d = create_driver %[
        command ruby -e "puts foo"
        tag test
        encoding invalid-encode
        <parse>
          @type none
        </parse>
      ]
    end
  end

  private

  def create_driver(conf)
    Fluent::Test::Driver::Input.new(Fluent::Plugin::ExecInput).configure(conf)
  end
end
