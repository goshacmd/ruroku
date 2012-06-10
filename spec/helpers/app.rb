module Helpers
  def app_data
    {
      id: 1, name: 'test-app', create_status: 'complete', stack: 'cedar',
      requested_stack: nil, git_url: nil, repo_migrate_status: 'complete',
      slug_size: 1_000_000, repo_size: 1_000_000, dynos: 10, workers: 0,
      created_at: Time.parse('01/01/2012 00:00')
    }
  end

  def app_response
    stubbed_response app_data
  end

  def apps_response
    stubbed_response [app_data]
  end
end
