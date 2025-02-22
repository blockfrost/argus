CREATE TABLE off_chain_pool_data (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pool_id BIGINT NOT NULL,
    ticker_name VARCHAR(5) NOT NULL,
    hash VARBINARY(32) NOT NULL,
    json JSON NOT NULL,
    bytes BLOB NOT NULL,
    pmr_id BIGINT NOT NULL,
    FOREIGN KEY (pool_id) REFERENCES pool_hash (id),
    FOREIGN KEY (pmr_id) REFERENCES pool_metadata_ref (id)
);
