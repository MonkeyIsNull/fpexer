defmodule DroidTest do
  use ExUnit.Case

  test "find all droids" do
     c = [ %{ :name => "han", :human => true, :droid => false  }, 
           %{ :name => "leia", :human => true, :droid => false }, 
           %{ :name => "r2d2", :human => false, :droid => true} ]   
    assert [%{droid: true, human: false, name: "r2d2"}] ==  Fpexer.find_by_type(c, [], :droid) 
    assert [%{droid: false, human: true, name: "leia"},
            %{droid: false, human: true, name: "han"}] ==  Fpexer.find_by_type(c, [], :human) 
  end

end
