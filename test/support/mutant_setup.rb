# frozen_string_literal: true

require "yard-markdown"

ModuleMarkdownTemplate = YARD::Templates::Engine.template(:default, :module, :markdown)
FulldocMarkdownTemplate = YARD::Templates::Engine.template(:default, :fulldoc, :markdown)
