# lib/elixir_spider/ebay.ex
defmodule EbayScraper do
  use Crawly.Spider

  @impl Crawly.Spider
  def base_url(), do: "https://www.ebay.com/"

  @impl Crawly.Spider
  def init() do
    [start_urls: ["https://www.ebay.com/sch/i.html?_nkw=ps5"]]
  end

  @impl Crawly.Spider
  def parse_item(response) do
      # Parse response body to document
      {:ok, document} = Floki.parse_document(response.body)

      # Create item (for pages where items exists)
      info =
          document
          |> Floki.find(".srp-results .s-item")
          |> Enum.map(fn x ->
            url = "123456"
           %{ url => %{
             "title" => Floki.find(x, ".s-item__title span") |> Floki.text(),
             "price" => Floki.find(x, ".s-item__price") |> Floki.text()}
            #  "url" => Floki.find(x, ".s-item__link") |> Floki.attribute("href") |> Floki.text(),
            }
            end)


      requests =
        document
        |> Floki.find(".s-pagination a.pagination__next")
        |> Floki.attribute("href")
        |> Crawly.Utils.build_absolute_urls(response.request_url)
        |> Crawly.Utils.requests_from_urls()


      %{
        # :requests => requests,
        items: [nil]
      }
  end

end
