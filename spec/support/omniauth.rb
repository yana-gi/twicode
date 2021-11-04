# frozen_string_literal: true

OmniAuth.config.test_mode = true
OmniAuth.config.on_failure = proc { |env| OmniAuth::FailureEndpoint.new(env).redirect_to_failure }
