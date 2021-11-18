import * from dw::io::http::Client
output json
var URL = "https://api.github.com/repos/mulesoft/mule-migration-assistant/releases"
var body = request("GET", URL).body
---
body map ((item) -> 
    {
        (item.&tag_name), 
        (item.&published_at),
        assets: {
            (item.assets map ((asset) -> {(asset.name): asset.download_count}))
        }
    }
)