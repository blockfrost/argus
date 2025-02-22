CREATE TABLE script (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tx_id BIGINT NOT NULL,
    hash VARBINARY(28) NOT NULL,
    type ENUM ('native', 'plutus') NOT NULL,
    json JSON,
    bytes BLOB,
    serialised_size INT UNSIGNED
);
