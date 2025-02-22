-- Add migration script here
CREATE TABLE redeemer_data (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hash VARBINARY(32) NOT NULL,
    tx_id BIGINT NOT NULL,
    value JSON,
    bytes BLOB NOT NULL,
    FOREIGN KEY (tx_id) REFERENCES tx (id)
);
