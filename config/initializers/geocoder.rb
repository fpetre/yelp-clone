Geocoder.configure(
  :always_raise => [TimeoutError],
  :timeout => 15,
  cache: Rails.cache
)
