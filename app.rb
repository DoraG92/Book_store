
require_relative 'lib/database_connection'
require_relative 'lib/book_repository'

# We need to give the database name to the method `connect`.
DatabaseConnection.connect('book_store')

# Perform a SQL query on the database and get the result set.
# sql = 'SELECT id, title, author_name FROM books;'
# result = DatabaseConnection.exec_params(sql, [])

# Print out each record from the result set .
books = BookRepository.new
books.all.each do |book|

  puts "#{book.id} - #{book.title} - #{book.author_name}"
end