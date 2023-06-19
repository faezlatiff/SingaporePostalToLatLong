import Config

config :crawly,
    closespider_timeout: :disabled  ,
    concurrent_requests_per_domain: 200,
    closespider_itemcount: :disabled,

    middlewares: [
            Crawly.Middlewares.DomainFilter,
            Crawly.Middlewares.UniqueRequest,
            {Crawly.Middlewares.UserAgent, user_agents: ["Mozilla/5.0 (X11; Linux x86_64; rv:109.0) Gecko/20100101 Firefox/114.0"]}
    ],
    pipelines: [
            Crawly.Pipelines.JSONEncoder,
            {Crawly.Pipelines.WriteToFile, extension: "json", folder: "./temp"}
    ]
