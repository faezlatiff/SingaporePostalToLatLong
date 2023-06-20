# SingaporePostalToLatLong
A JSON file of all possible Singapore postal codes and their respective latlongs (organised into a list) based on the OneMap API by Singapore Land Authority [here](https://developers.onemap.sg/commonapi/search?searchVal=238823&returnGeom=Y&getAddrDetails=Y&pageNum=1). Updated as at 19 June 2023.

I've also added the Elixir-based crawler if you're interested to see what's under the hood. 

## How to run Elixir-based Crawler
1. `cd` into `onemap` folder
2. run `mix deps.get`
3. run in terminal: `iex -S mix run -e "Crawly.Engine.start_spider(OneMapScraper)"`

Note: This file only takes the latlong of the first address of the postal code. For example, postal 238823 has multiple latlongs, but the file only stores the first latlong.

## Files & Details
`onemap_crawler.ex`: A file containing the main logic of the crawler. <br />
`subset_onemap.ex`: A file containing the list of existing postal codes as a result of the crawler back in 2020, courtesy of Scratchbac.<br />
`superset_onemap.ex`: A file containing the list of postal codes as a result of the crawler in 2023.<br />
`onemap.ex`: A module that uses `subset_onemap.ex` to check `superset_onemap.ex` for any missing postal codes. If there are, you can run `Onemap.get_list_of_new_urls()` and plug into the `start_urls` field of `onemap_crawler.ex`. 
