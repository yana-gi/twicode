# frozen_string_literal: true

languages = %w[Bash C C# C++ CSS Diff Go HTML XML JSON Java JavaScript Kotlin Markdown PHP PlainText Perl Python R Ruby Rust SCSS SQL Shell Swift TypeScript YAML]

languages.each { |language| Language.create(name: language) }
