require 'test_helper'

class Resolvers::CreateLinkTest < ActiveSupport::TestCase
  def perform(args = {})
    Resolvers::CreateLink.new.call(nil, args, {})
  end

  test 'success' do
    link = perform(
      url: 'www.google.com',
      description: 'desc'
    )

    assert link.persisted?
    assert_equal link.description, 'desc'
    assert_equal link.url, 'www.google.com'
  end
end
