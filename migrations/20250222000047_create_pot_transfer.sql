CREATE TABLE pot_transfer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    cert_index INT NOT NULL,
    treasury BIGINT NOT NULL,
    reserves BIGINT NOT NULL,
    tx_id BIGINT NOT NULL,
    FOREIGN KEY (tx_id) REFERENCES tx (id)
);
