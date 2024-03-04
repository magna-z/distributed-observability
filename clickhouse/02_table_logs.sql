CREATE TABLE IF NOT EXISTS logs
(
  `timestamp` DateTime('UTC') CODEC(T64),
  `level` LowCardinality(String),
  `message` String,
  `app` LowCardinality(String),
  `host` LowCardinality(String),
  `data` Map(LowCardinality(String), String)
)
ENGINE = MergeTree
PARTITION BY toDate(`timestamp`)
ORDER BY `timestamp`
TTL `timestamp` + INTERVAL 1 MONTH DELETE
SETTINGS ttl_only_drop_parts = 1;
