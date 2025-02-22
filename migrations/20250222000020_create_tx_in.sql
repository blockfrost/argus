CREATE TABLE tx_in (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tx_in_id BIGINT NOT NULL,
    tx_out_id BIGINT NOT NULL,
    tx_out_index SMALLINT UNSIGNED NOT NULL,
    redeemer_id BIGINT,
    FOREIGN KEY (tx_in_id) REFERENCES tx (id),
    FOREIGN KEY (tx_out_id) REFERENCES tx (id),
    FOREIGN KEY (redeemer_id) REFERENCES redeemer (id)
);
