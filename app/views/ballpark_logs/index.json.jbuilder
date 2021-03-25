# frozen_string_literal: true

json.array! @ballpark_logs, partial: "ballpark_logs/ballpark_log", as: :ballpark_log
