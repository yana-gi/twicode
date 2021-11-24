# frozen_string_literal: true

# rubocop:disable Layout/LineLength
languages = %w[Bash C C# C++ CSS Diff Go HTML XML JSON Java JavaScript Kotlin Markdown PHP PlainText Perl Python R Ruby Rust SCSS SQL Shell Swift TypeScript YAML]
# rubocop:enable Layout/LineLength

languages.each { |language| Language.create(name: language) }
