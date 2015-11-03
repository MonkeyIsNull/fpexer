defmodule FpexerTest do
  use ExUnit.Case
  doctest Fpexer

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

  test "find all droids" do
     c = [ %{ :name => "han", :human => true, :droid => false  }, 
           %{ :name => "leia", :human => true, :droid => false }, 
           %{ :name => "r2d2", :human => false, :droid => true} ]   
    assert [%{droid: true, human: false, name: "r2d2"}] ==  Fpexer.find_by_type(c, [], :droid) 
    assert [%{droid: false, human: true, name: "leia"},
            %{droid: false, human: true, name: "han"}] ==  Fpexer.find_by_type(c, [], :human) 
  end

end
