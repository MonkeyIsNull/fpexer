defmodule FpexerTest do
  use ExUnit.Case

  test "find unique names" do
    assert ["Open", "Asset", "Core", "Xcode", "_launchservicesd"] ==  File.read!("fixtures/passwd") |>
    String.split("\n") |>
    Enum.map(&(String.split(&1, ":"))) |>
    Enum.map(&(Enum.at(&1,4))) |>
    Enum.filter(&(!is_nil(&1))) |> 
    Enum.map(&(String.split(&1, " "))) |>
    Enum.map(&(Enum.at(&1,0))) |>
    Enum.uniq
  end
end
