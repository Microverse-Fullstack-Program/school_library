require_relative '../rental'

module CreateRental
  def create_rental(rentals)
    if @books.empty? || @persons.empty?
      puts 'Cannot create rental because there are no books or people!'
    else
      b_index = select_book
      return if b_index.nil?

      p_index = select_person
      return if p_index.nil?

      print 'Date [YYYY/MM/DD]: '
      date = gets.chomp
      rentals << Rental.new(date, @books[b_index.to_i], @persons[p_index])
      puts 'Rental created successfully:'
    end
  end

  def select_book
    puts 'Select a book from the following list by number'
    @books.each_with_index { |book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}" }
    b_index = gets.chomp
    return b_index.to_i unless b_index.empty? || b_index.to_i > @books.length || b_index.to_i.negative?

    puts 'Invalid book selection, try again!'
    nil
  end

  def select_person
    puts 'Select a person from the following list by number (not id)'
    @persons.each_with_index do |person, index|
      print "#{index})"
      print '[Student]: ' if person.is_a?(Student)
      print '[Teacher]: ' if person.is_a?(Teacher)
      puts "Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    p_index = gets.chomp
    return p_index.to_i unless p_index.empty? || p_index.to_i > @persons.length || p_index.to_i.negative?

    puts 'Invalid person selection, try again!'
    nil
  end
end
