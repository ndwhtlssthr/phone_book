require_relative 'entry_repository'

class PhoneBook
  attr_reader :repository

  def initialize(repository= EntryRepository.load_entries('./data'))
    @repository = repository
  end

  def lookup(name)
    repository.find_by_last_name(name)
  end

end
