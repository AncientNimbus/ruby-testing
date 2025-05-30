# frozen_string_literal: true

require_relative '../lib/10_drink'

describe Drink do
  describe '#initialize' do
    # The Drink class needs to have an attr_reader for both :type and :ounces.
    context 'when using default initialization' do
      subject(:default_drink) { Drink.new }

      it 'is water' do
        expect(default_drink.type).to eq('water')
      end

      it 'has 16 ounces' do
        expect(default_drink.ounces).to eq(16)
      end
    end

    context 'when specifying the type and ounces' do
      subject(:my_coffee) { Drink.new('coffee', 8) }

      it 'is coffee' do
        expect(my_coffee.type).to eq('coffee')
      end

      it 'has 8 ounces' do
        expect(my_coffee.ounces).to eq(8)
      end
    end

    # Use 'described_class' instead of the class name to limit the code that
    # needs to be changed, if/when it changes. For example, as applications
    # develop, class names are subject to change, so that Drink could be
    # changed to 'Beverage'. If that change were made, every time the word
    # 'Drink' was used, it would have to be changed to 'Beverage'.

    context 'when limiting future code changes' do
      subject(:my_drink) { described_class.new('juice') }

      it 'is juice' do
        expect(my_drink.type).to eq('juice')
      end

      it 'has 16 ounces' do
        expect(my_drink.ounces).to eq(16)
      end
    end
  end

  describe '#full?' do
    context 'when using magic matchers' do
      # When using a method that returns a boolean value & does not take any
      # parameters, you can use magic matchers.
      # http://testing-for-beginners.rubymonstas.org/rspec/matchers.html

      context 'when using default initialization' do
        subject(:default_drink) { described_class.new }

        it 'is full' do
          expect(default_drink).to be_full
        end
      end

      context 'when drink has 8 ounces' do
        subject(:my_coffee) { described_class.new('coffee', 8) }

        it 'is not full' do
          expect(my_coffee).not_to be_full
        end
      end
    end
  end
end

# ASSIGNMENT

describe Drink do
  describe '#initialize' do
    context 'when type is specified and ounces is default' do
      subject(:my_tea) { described_class.new('green tea') }

      it 'is your choice of beverage' do
        expect(my_tea.type).to eq('green tea')
      end

      it 'has 16 ounces' do
        expect(my_tea.ounces).to eq(16)
      end
    end
  end

  describe '#full?' do
    context 'when drink has 16 ounces or more' do
      subject(:my_soda) { described_class.new('Bepis') }

      it 'is full' do
        expect(my_soda).to be_full
      end
    end

    context 'when drink has less than 16 ounces' do
      subject(:my_wine) { described_class.new('Red wine', 8) }

      it 'is not full' do
        expect(my_wine).not_to be_full
      end
    end
  end
end
