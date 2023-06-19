# SingaporePostalToLatLong
A JSON file of all possible Singapore postal codes and their respective latlongs (organised into a list) based on the OneMap API by Singapore Land Authority [here](https://developers.onemap.sg/commonapi/search?searchVal=238823&returnGeom=Y&getAddrDetails=Y&pageNum=1). Updated as at 19 June 2023.

I've also added the Elixir-based crawler if you're interested to see what's under the hood. 

Note: This file only takes the latlong of the first address of the postal code. For example, postal 238823 has multiple latlongs, but the file only stores the first latlong.
