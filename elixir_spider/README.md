# ElixirSpider
This is an Elixir-based crawler built to scrape a website and return a JSON file in /temp folder. 
`onemap.ex` scrapes OneMap's API [here](https://developers.onemap.sg/commonapi/search?searchVal=238823&returnGeom=Y&getAddrDetails=Y&pageNum=1), and `ebay.ex` scrapes eBay's website for PS5 consoles. 

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `elixir_spider` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:elixir_spider, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/elixir_spider>.

