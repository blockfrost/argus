CREATE TABLE pool_metadata_ref (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pool_id BIGINT NOT NULL,
    url VARCHAR(255) NOT NULL, -- URL length
    hash VARBINARY(32) NOT NULL,
    registered_tx_id BIGINT NOT NULL,
    FOREIGN KEY (pool_id) REFERENCES pool_hash (id),
    FOREIGN KEY (registered_tx_id) REFERENCES tx (id)
);
