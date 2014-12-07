class ResultPage
  def initialize(subject, session)
    @subject = subject
    @session = session
  end
  attr_reader :page
  def page
    @session.page
  end
  def is_valid?
    @session.find('h1').text == @subject
  end
  def has_text? text
    @session.has_text? text
  end
end