# frozen_string_literal: true

require_relative '../lib/12_magic_seven'

# The file order to complete this lesson:
# 1. Familiarize yourself with the class in lib/12_magic_seven.rb
# 2. Complete spec/12_magic_seven_spec.rb

# Before learning any more complexities of testing, let's take a look at a
# standard testing pattern: Arrange, Act, and Assert.
# https://youtu.be/f8gjbPLFnqU

# 1. Arrange -> set up the test (examples: initializing objects, let
#               variables, updating values of instance variables).
# 2. Act ->     execute the logic to test (example: calling a method to run).
# 3. Assert ->  expect the results of arrange & act.

# The tests in this lesson are fairly easy to understand, and it may seem
# ridiculous to use A-A-A for them. However, tests should be easily understood
# not just by you, but also by someone that is not familiar with the code.

# NOTE: When you start using A-A-A to format your tests, it will feel
# strange to not be following DRY (Don't Repeat Yourself). With tests, however,
# repetition is necessary in order for them to be easy to read. If you are using
# rubocop, you can disable specific (or all) cops for certain files (or
# directories) by adding a .rubocop.yml file.
# https://docs.rubocop.org/rubocop/configuration.html#includingexcluding-files

# When you start working on an existing code base, you will often become familiar
# with the code by reading the tests.

describe MagicSeven do
  # This next line should be very familiar, and it is part of the 'Arrange' step.
  subject(:game) { described_class.new }

  describe '#add_nine' do
    # This test could be written as below (and it would pass):
    it 'returns 15' do
      expect(game.add_nine(6)).to eq(15)
    end

    # However, the above test is NOT very readable. For example, it does not
    # explain where '6' came from. So let's start with explaining
    # where '6' came from, as part of the 'Arrange' step.
    it 'returns 15' do
      random_number = 6

      # For the 'Act' step, we will be testing the result of the logic of adding
      # nine to the random_number.
      result = game.add_nine(random_number)

      # For the 'Assert' step, we know exactly what we expect the result to be:
      expect(result).to eq(15)
    end
  end

  # In addition, using a context to explain the conditions of the test makes
  # the output more readable.
  describe '#multiply_by_two' do
    context 'when the previous step is 8' do
      it 'returns 16' do
        previous_step = 8 # Arrange
        result = game.multiply_by_two(previous_step) # Act
        expect(result).to eq(16) # Assert
      end
    end
  end

  # ASSIGNMENT

  describe '#subtract_four' do
    context 'when the previous step is 16' do
      it 'returns 12' do
        previous_step = 16 # Arrange
        result = game.subtract_four(previous_step) # Act
        expect(result).to eq(12) # Assert
      end
    end
  end

  describe '#divide_by_two' do
    context 'when the previous step is 12' do
      it 'returns 6' do
        previous_step = 12
        result = game.divide_by_two(previous_step)
        expect(result).to eq(6)
      end
    end
  end

  # The following tests will need you to create new instances of MagicSeven with
  # a specific value for the random_number.
  describe '#subtract_random_number' do
    let(:magic_number) { described_class.new(8) }

    context 'when the previous step is 7 and random number is 8' do
      it 'returns the magic number 7' do
        previous_step = 15
        result = magic_number.subtract_random_number(previous_step)
        expect(result).to eq(7)
      end
    end
  end

  # The #play method will always return seven! Test this game, using any
  # integer as the random_number. Update the context with the number.
  describe '#play' do
    let(:number18) { described_class.new(18) }
    context 'when the random number is ...' do
      it 'will return 7' do
        result = number18.play
        expect(result).to eq(7)
      end
    end

    let(:number_neg11) { described_class.new(-11) }
    context 'when the random number is -11' do
      it 'will return 7' do
        result = number_neg11.play
        expect(result).to eq(7)
      end
    end

    let(:number999) { described_class.new(999) }
    context 'when the random number is 999' do
      it 'will return 7' do
        result = number999.play
        expect(result).to eq(7)
      end
    end
  end
end
