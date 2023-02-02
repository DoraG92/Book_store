require 'book_repository'

RSpec.describe BookRepository do
  def reset_books_table
    seed_sql = File.read('spec/seeds_book.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'book_store' })
    connection.exec(seed_sql)
  end

  before(:each) do 
    reset_books_table
  end

  it 'returns five books' do 
    repo = BookRepository.new
    books = repo.all # return result
    
    
    expect(books.length).to eq(5)
    expect(books.first.title).to eq('Nineteen Eighty-Four') 
    expect(books.first.author_name).to eq('George Orwell')
  end
end