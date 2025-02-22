CREATE TABLE committee_registration (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tx_id BIGINT NOT NULL,
    cert_index INT NOT NULL,
    cold_key_id BIGINT NOT NULL,
    hot_key_id BIGINT NOT NULL,
    FOREIGN KEY (tx_id) REFERENCES tx (id),
    FOREIGN KEY (cold_key_id) REFERENCES committee_hash (id),
    FOREIGN KEY (hot_key_id) REFERENCES committee_hash (id)
);
