CREATE TABLE IF NOT EXISTS metrics
(
  `timestamp` DateTime('UTC') CODEC(DoubleDelta),
  `name` LowCardinality(String),
  `type` LowCardinality(String),
  `value` Float64 CODEC(Gorilla),
  `buckets` Map(LowCardinality(String), Float64),
  `quantiles` Map(LowCardinality(String), Float64),
  `host` LowCardinality(String),
  `tags` Map(LowCardinality(String), String)
)
ENGINE = MergeTree
PARTITION BY toDate(`timestamp`)
ORDER BY (`timestamp`, `name`)
TTL `timestamp` + INTERVAL 3 MONTH DELETE
SETTINGS ttl_only_drop_parts = 1;
