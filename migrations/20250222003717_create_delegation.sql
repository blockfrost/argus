CREATE TABLE delegation (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    cert_index INT NOT NULL,
    pool_hash_id BIGINT NOT NULL,
    active_epoch_no BIGINT NOT NULL,
    tx_id BIGINT NOT NULL,
    slot_no BIGINT UNSIGNED NOT NULL,
    redeemer_id BIGINT,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (pool_hash_id) REFERENCES pool_hash (id),
    FOREIGN KEY (tx_id) REFERENCES tx (id),
    FOREIGN KEY (redeemer_id) REFERENCES redeemer (id)
);
