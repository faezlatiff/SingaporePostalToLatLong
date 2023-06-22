defmodule Onemap do

  def not_found_in_SBData() do
    subset_keys = Map.keys(SBData.data())
    Enum.map(subset_keys, fn x -> check_if_exist(x, ScrapedData.data()) end ) |> Enum.uniq()
  end

  def get_list_of_new_urls() do
    na_list = Onemap.address_not_found_list()
    url = "https://developers.onemap.sg/commonapi/search?returnGeom=Y&getAddrDetails=Y&pageNum=1&searchVal="

    Enum.map(na_list, fn x -> url <> x end)
  end

  def get_valid_postals_only() do
    
  end

  def address_not_found_list() do
    all_numbers = Enum.to_list(10000..999999) |> Enum.map(&(postal_to_string(&1)))
    list = Map.keys(ScrapedData.data())
    all_numbers -- list
  end

  defp check_if_exist(subset_key, superset) do
    if not Map.has_key?(superset, subset_key) do
      subset_key
    end
  end

  defp postal_to_string(code) when code < 100000, do: "0" <> Integer.to_string(code)
  defp postal_to_string(code) when code >= 100000, do: Integer.to_string(code)

end
