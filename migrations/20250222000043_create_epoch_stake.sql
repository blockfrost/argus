CREATE TABLE epoch_stake (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    pool_id BIGINT NOT NULL,
    amount BIGINT UNSIGNED NOT NULL,
    epoch_no INT UNSIGNED NOT NULL,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (pool_id) REFERENCES pool_hash (id)
);
