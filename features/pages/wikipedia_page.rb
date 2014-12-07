class WikipediaPage
  def initialize(session)
    @session = session
    @session.visit 'http://en.wikipedia.org/wiki/Main_Page'
  end
  def search_for(subject)
    @session.fill_in('searchInput', :with => subject)
    @session.click_on('searchButton')
  end
end
