class MixpanelAPI

  require 'rubygems'
  require 'mixpanel_client'

  config = {api_key: MIXPANEL_CONFIG['mixpanel_api_key'], api_secret: MIXPANEL_CONFIG['mixpanel_api_secret']}
  @@client = Mixpanel::Client.new(config)

  def self.get_funnel
    data = @@client.request('funnels', {
        #from_date: 1.month.ago.strftime('"%Y-%m-%d'),
        #to_date: Date.current.strftime('"%Y-%m-%d'),
        expire: (DateTime.current + 1.hour).to_i,
        funnel_id: MIXPANEL_CONFIG['funnel_id'],
        where: "properties[\"utm_campaign\"] == \"Buffer\"",
        unit: 'month'
    })
    data
  end


  def self.get_funnels
    data = @@client.request('funnels/list', {
        expire: (DateTime.current + 1.hour).to_i
    })
    data
  end

end