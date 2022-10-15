require_relative('nameable')
require_relative('decorator')
require_relative('trimmer_decorator')
require_relative('capitalize_decorator')

class Person < Nameable
  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @age = age
    @id = Random.rand(1..1000)
    @name = name
    @parent_permission = parent_permission
  end
  attr_accessor :name, :age
  attr_reader :id

  def can_use_services?
    of_age? || @parent_permission ? true : false
  end

  def correct_name
    @name
  end

  def add_book(book, date)
    @rentals << Rental.new(date, book, self)
  end

  private

  def of_age?
    @age >= 18
  end
end

person = Person.new(22, 'maximilianus')
person.correct_name
capitalized_person = CapitalizeDecorator.new(person)
capitalized_person.correct_name
capitalized_trimmed_person = TrimmerDecorator.new(capitalized_person)
capitalized_trimmed_person.correct_name
