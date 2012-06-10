module Helpers
  def process_data
    {
      upid: '0000000', process: 'web.1', type: 'Dyno',
      command: 'bundle exec puma', app_name: 'the-demo', slug: '0000000_0000',
      action: 'down', state: 'idle', pretty_state: 'idle for 1h', elapsed: 0,
      rendezvous_url: nil, attached: false,
      transitioned_at: Time.parse('06/06/2012 23:59')
    }
  end

  def processes_response
    stubbed_response [process_data]
  end
end
