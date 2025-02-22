CREATE TABLE tx_out (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    address VARCHAR(100) NOT NULL,
    address_has_script BOOLEAN NOT NULL,
    data_hash VARBINARY(32),
    consumed_by_tx_id BIGINT,
    `index` SMALLINT UNSIGNED NOT NULL,
    inline_datum_id BIGINT,
    payment_cred VARBINARY(28),
    reference_script_id BIGINT,
    stake_address_id BIGINT,
    tx_id BIGINT NOT NULL,
    value BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (consumed_by_tx_id) REFERENCES tx (id),
    FOREIGN KEY (inline_datum_id) REFERENCES datum (id),
    FOREIGN KEY (reference_script_id) REFERENCES script (id),
    FOREIGN KEY (stake_address_id) REFERENCES stake_address (id),
    FOREIGN KEY (tx_id) REFERENCES tx (id)
);
