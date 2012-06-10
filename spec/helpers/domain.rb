module Helpers
  def domain_data
    {
      id: 1, app_id: 1, domain: 'foo.bar.com', base_domain: 'bar.com',
      default: nil, created_at: Time.parse('05/05/2012 00:00'),
      updated_at: Time.parse('06/06/2012 00:00')
    }
  end

  def domains_response
    stubbed_response [domain_data]
  end
end
