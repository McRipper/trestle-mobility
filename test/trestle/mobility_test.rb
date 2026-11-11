require "test_helper"

class Trestle::MobilityTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Trestle::Mobility::VERSION
  end

  class TranslatedRecord
    include ActiveModel::Model
    attr_accessor :title_en, :title_it, :body_en, :body_it, :published_en, :published_it
  end

  def setup
    @template = Trestle::ApplicationController.new.view_context
    @template.define_singleton_method(:admin) { nil }
    @builder = Trestle::Form::Builder.new(:record, TranslatedRecord.new(title_it: 'Ciao'), @template, {})
  end

  def test_text_field_renders_both_locales_with_bootstrap_five_dropdown
    html = @builder.mobility_text_field(:title, wrapper: false)
    assert_includes html, 'record[title_en]'
    assert_includes html, 'record[title_it]'
    assert_includes html, 'value="Ciao"'
    assert_includes html, 'data-bs-toggle="dropdown"'
  end

  def test_text_area_renders_both_locales
    html = @builder.mobility_text_area(:body, wrapper: false)
    assert_includes html, 'record[body_en]'
    assert_includes html, 'record[body_it]'
  end

  def test_check_box_renders_both_locales
    html = @builder.mobility_check_box(:published, wrapper: false)
    assert_includes html, 'record[published_en]'
    assert_includes html, 'record[published_it]'
  end
end
