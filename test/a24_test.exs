defmodule A24Test do
  use ExUnit.Case

  test "day 1 pt 2" do
    assert A24.day1pt2() == 26_859_182
  end

  test "day 1" do
    assert A24.day1() == 1_320_851
  end
end
