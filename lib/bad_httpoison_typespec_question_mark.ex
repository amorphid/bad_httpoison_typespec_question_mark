defmodule Foo do
  @moduledoc """
  Documentation for Foo.
  """

  @type url :: String.t()

  @spec get() :: 1
  def get() do
    :not_1
  end

  @spec get(url()) :: 1
  def get(url) do
    HTTPoison.get(url, [], [:async,stream_to: self()])
  end
end
