defmodule A24 do
  @moduledoc """
  Advent of Code 2024 solutions.
  """
  alias A24.Inputs

  def day1pt2 do
    Inputs.day1()
    |> String.split("\n")
    |> Enum.reduce(
      [[], []],
      fn line, [list_1_acc, list_2_acc] = separated_lists ->
        if line != "" do
          [list_1_item, list_2_item] =
            line
            |> String.split("   ", trim: true)
            |> Enum.map(&String.to_integer/1)

          [[list_1_item | list_1_acc], [list_2_item | list_2_acc]]
        else
          [list_1_sorted, list_2_sorted] =
            Enum.map(separated_lists, &Enum.sort/1)

          # NOTE: this is the only diff b/w this & day 1
          _total_similarity_score =
            Enum.reduce(list_1_sorted, 0, fn id, similarity_score ->
              left_num_in_right_list_count =
                list_2_sorted
                |> Enum.filter(fn list_2_item -> id == list_2_item end)
                |> Enum.count()

              similarity_score + id * left_num_in_right_list_count
            end)
        end
      end
    )
  end

  def day1 do
    Inputs.day1()
    |> String.split("\n")
    |> Enum.reduce(
      [[], []],
      fn line, [list_1_acc, list_2_acc] = separated_lists ->
        if line != "" do
          [list_1_item, list_2_item] =
            line
            |> String.split("   ", trim: true)
            |> Enum.map(&String.to_integer/1)

          [[list_1_item | list_1_acc], [list_2_item | list_2_acc]]
        else
          [list_1_sorted, list_2_sorted] =
            Enum.map(separated_lists, &Enum.sort/1)

          _total_distance =
            Enum.zip_reduce(list_1_sorted, list_2_sorted, 0, fn a, b, total_distance ->
              total_distance + abs(a - b)
            end)
        end
      end
    )
  end
end
