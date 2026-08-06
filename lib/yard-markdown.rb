# frozen_string_literal: true

require "yard"
require_relative "yard/markdown/aref_helper"
require_relative "yard/markdown/collection_rendering_helper"
require_relative "yard/markdown/documentation_helper"
require_relative "yard/markdown/heading_helper"
require_relative "yard/markdown/link_normalization_helper"
require_relative "yard/markdown/metadata_section_helper"
require_relative "yard/markdown/method_presentation_helper"
require_relative "yard/markdown/object_listing_helper"
require_relative "yard/markdown/section_assembly_helper"
require_relative "yard/markdown/tag_formatting_helper"

module YARD
  module Markdown
  end
end

YARD::Templates::Engine.register_template_path File.dirname(__FILE__) + "/../templates"
