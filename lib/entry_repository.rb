require_relative 'entry'
require 'csv'

class EntryRepository
  attr_reader :entries


  def self.load_entries(directory)
    file = File.join(directory, 'people.csv')
    data = CSV.open(file, headers: true, header_converters: :symbol)
    rows = data.map do |row|
      row.to_hash
    end
    
    new(rows)
  end

  def initialize(entries)
    @entries ||= entries.map {|entry| Entry.new(entry)}
  end

  def find_by_last_name(last_name)
    entries.select{|entry| entry.last_name == last_name}
  end


end
