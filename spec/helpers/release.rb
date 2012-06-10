module Helpers
  def release_data
    {
      name: 'v1', descr: 'Add-on add example:basic',
      user: 'releasing-user@me.com', commit: '0f0e0d',
      env: { 'KEY1' => 'value' }, addons: ['example:basic'],
      pstable: { 'web' => 'bundle exec puma' },
      created_at: Time.parse('06/06/2012 00:00')
    }
  end

  def releases_response
    stubbed_response [release_data]
  end
end
