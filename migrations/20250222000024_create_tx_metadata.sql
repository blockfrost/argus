CREATE TABLE tx_metadata (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    `key` BIGINT UNSIGNED NOT NULL,
    json JSON,
    bytes BLOB NOT NULL,
    tx_id BIGINT NOT NULL,
    FOREIGN KEY (tx_id) REFERENCES tx (id)
);
