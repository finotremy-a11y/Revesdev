module ProjectsHelper
  def safe_url(url)
    return nil if url.blank?

    uri = URI.parse(url)
    uri.is_a?(URI::HTTP) || uri.is_a?(URI::HTTPS) ? uri.to_s : nil
  rescue URI::InvalidURIError
    nil
  end
end
