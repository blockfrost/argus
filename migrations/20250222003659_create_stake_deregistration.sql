CREATE TABLE stake_deregistration (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    cert_index INT NOT NULL,
    epoch_no INT UNSIGNED NOT NULL,
    tx_id BIGINT NOT NULL,
    redeemer_id BIGINT,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (tx_id) REFERENCES tx (id),
    FOREIGN KEY (redeemer_id) REFERENCES redeemer (id)
);
