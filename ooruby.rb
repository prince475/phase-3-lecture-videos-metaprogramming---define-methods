require 'pry'
class Animal

  attr_accessor :name, :age, :species
  @all = []

  def initialize(args)
    # @name = args[:name]
    # @age = args[:age]
    # @species = args[:species]
    args.each_key do |key, value|
      self.send("#{key}=", args[key])
      # self.send("#{key}=", value) method allows us to build a class with dynamic attributes.
      # It allows us, to put any number of attributes with any number of values.
    end

    @@all << self
  end

  def self.all
    @@all
  end

  # Making a method that can build other methods using metaprogramming and an inbuilt ruby method called 'define_method'.
  # that takes an argument which is the name of the method.
  def self.method_builder(method_name)
    define_method(method_name){
        'hello world'
    }
  end
end


cat = {
  name: 'Rose',
  age: 9,
  species: 'F.cactus'
}

animal = Animal.new(cat)

# if you call animal.Hi then it should essentially print 'hello world'.
# this is essentially building a method that can dynamically build  and name its own method.
Animal.method_builder('hi')


binding.pry
