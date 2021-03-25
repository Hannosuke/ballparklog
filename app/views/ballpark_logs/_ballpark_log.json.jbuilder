# frozen_string_literal: true

json.extract! ballpark_log, :id, :title, :description, :created_at, :updated_at
json.url ballpark_log_url(ballpark_log, format: :json)
