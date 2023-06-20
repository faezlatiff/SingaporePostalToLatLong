# lib/elixir_spider/ebay.ex
defmodule OneMapScraper do
  use Crawly.Spider
  alias Onemap

  @impl Crawly.Spider
  def base_url(), do: "https://developers.onemap.sg/"

  @impl Crawly.Spider
  def init() do

    url = "https://developers.onemap.sg/commonapi/search?returnGeom=Y&getAddrDetails=Y&pageNum=1&searchVal="

    url_list =
      # Onemap.get_list_of_new_urls()

      Enum.map(10000..830000, fn number ->
        "#{url}#{postal_to_string(number)}"
      end)



    [start_urls: url_list]

  end

  @impl Crawly.Spider
  def parse_item(response) do

    {:ok, data} = Jason.decode(response.body)

    data["results"]
    |> Enum.at(0)
    |> get_location_info()
    |> maybe_store()

  end

  defp get_location_info(json) when is_map(json) do

    postal = json["POSTAL"]
    lat = json["LATITUDE"]
    lon = json["LONGITUDE"]
    address =
      json["ADDRESS"]
      |> String.split(" SINGAPORE")
      |> Enum.at(0)
    %{
      postal => %{
        "lat" => lat,
        "lon" => lon,
        "address" => address
      }
    }
  end

  defp get_location_info(_), do: nil
  defp maybe_store(location_info) when not is_nil(location_info), do: %{items: [location_info]}
  defp maybe_store(_), do: %{items: []}

  defp postal_to_string(code) when code < 100000, do: "0" <> Integer.to_string(code)
  defp postal_to_string(code) when code >= 100000, do: Integer.to_string(code)

  # defp build_next_request(url) do

  #   new_postal =
  #     URI.parse(url).query
  #     |> URI.decode_query()
  #     |> Map.get("searchVal")
  #     |> String.to_integer()
  #     |> (&(&1+1)).()
  #     |> postal_to_string()

  #   new_query =
  #     URI.parse(url).query
  #     |> URI.decode_query()
  #     |> Map.replace("searchVal", new_postal)
  #     |> URI.encode_query()

  #   URI.parse(url)
  #   |> Map.replace(:query, new_query)
  #   |> URI.to_string()
  #   |> Crawly.Utils.request_from_url()

  # end




end
