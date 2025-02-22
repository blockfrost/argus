CREATE TABLE withdrawal (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    amount BIGINT UNSIGNED NOT NULL,
    redeemer_id BIGINT,
    tx_id BIGINT NOT NULL,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (redeemer_id) REFERENCES redeemer (id),
    FOREIGN KEY (tx_id) REFERENCES tx (id)
);
