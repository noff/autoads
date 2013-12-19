class MixpanelAPI

  @@api_key = MIXPANEL_CONFIG['mixpanel_api_key']
  @@api_secret = MIXPANEL_CONFIG['mixpanel_api_secret']

  def self.get_funnel
    Rails.logger.info @@api_key
  end

end