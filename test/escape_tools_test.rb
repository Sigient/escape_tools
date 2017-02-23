# encoding: UTF-8

require 'test_helper'

class EscapeToolsTest < Minitest::Test
  # Please note, some of these tests come from Ruby's stdlib tests:
  # https://github.com/ruby/ruby/blob/trunk/test/cgi/test_cgi_util.rb

  test 'it defines a version number' do
    refute_nil ::EscapeTools::VERSION
  end

  test 'escape' do
    str1 = "&<>\" \xE3\x82\x86\xE3\x82\x93\xE3\x82\x86\xE3\x82\x93"

    assert_equal '%26%3C%3E%22+%E3%82%86%E3%82%93%E3%82%86%E3%82%93',
      EscapeTools::escape(str1)
  end

  test 'escape with invalid byte sequence' do
    #assert_equal '%C0%3C%3C',
      #EscapeTools::escape("\xC0\<\<".dup.force_encoding("UTF-8"))
  end

  test 'escape with invalid argument type' do
    assert_raises TypeError do
      EscapeTools::escape(Hash.new)
    end
  end

  test 'escapeHTML' do
    assert_equal "&#39;&amp;&quot;&gt;&lt;", EscapeTools::escapeHTML("'&\"><")
  end

  test 'escapeHTML with invalid argument type' do
    assert_raises TypeError do
      EscapeTools::escapeHTML(42)
    end
  end

  test 'escape_html alias' do
    assert_equal "&#39;&amp;&quot;&gt;&lt;", EscapeTools::escape_html("'&\"><")
  end
end
