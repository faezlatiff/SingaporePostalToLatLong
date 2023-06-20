defmodule Onemap do
  alias Subset
  alias Superset

  def address_not_found_list() do
    subset_keys = Map.keys(Subset.subset())
    Enum.map(subset_keys, fn x -> check(x, Superset.superset()) end ) |> Enum.uniq()
  end

  defp check(subset_key, superset) do
    if not Map.has_key?(superset, subset_key) do
      subset_key
    end
  end

  def get_list_of_new_urls() do
    [nil | na_list] = Onemap.address_not_found_list()
    url = "https://developers.onemap.sg/commonapi/search?returnGeom=Y&getAddrDetails=Y&pageNum=1&searchVal="

    Enum.map(na_list, fn x -> url <> x end)
  end

end
