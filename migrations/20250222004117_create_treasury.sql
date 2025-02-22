CREATE TABLE treasury (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    cert_index INT NOT NULL,
    amount BIGINT NOT NULL, -- Signed for potential negatives
    tx_id BIGINT NOT NULL,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (tx_id) REFERENCES tx (id)
);
