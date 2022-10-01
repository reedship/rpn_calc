require 'minitest/autorun'
require_relative './calc.rb'

class TestCalc < Minitest::Test
  def setup
    @calc = Calc.new
  end

  def test_single_line_eval
    assert_output "-2.0\n" do
      @calc.eval('-2')
    end
  end

  def test_multiple_line_addition_eval
    assert_output "-2.0\n" do
      @calc.eval("-2")
    end
    assert_output "-2.0\n" do
      @calc.eval("-2")
    end
    assert_output "-4.0\n" do
      @calc.eval("+")
    end
  end

  def test_multiple_line_subtraction_eval
    assert_output "2.0\n" do
      @calc.eval("2")
    end
    assert_output "9.0\n" do
      @calc.eval("9")
    end
    assert_output "7.0\n" do
      @calc.eval("-")
    end
  end

  def test_multiple_line_multiplication_eval
    assert_output "-2.0\n" do
      @calc.eval('-2')
    end
    assert_output "8.0\n" do
      @calc.eval('8')
    end
    assert_output "-16.0\n" do
      @calc.eval('*')
    end
  end

  def test_multiple_line_division_eval
    assert_output "-2.0\n" do
      @calc.eval('-2')
    end
    assert_output "8.0\n" do
      @calc.eval('8')
    end
    assert_output "-4.0\n" do
      @calc.eval('/')
    end
  end
end
