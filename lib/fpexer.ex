defmodule Fpexer do
  def find_by_type([], acc, type) do
    acc
  end

  def find_by_type([x|xs], acc, type) do
     if x[type] do
       find_by_type(xs,[ x | acc ], type) 
     else
       find_by_type(xs, acc, type)
     end
  end
end
