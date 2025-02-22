CREATE TABLE collateral_tx_out (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tx_id BIGINT NOT NULL,
    `index` SMALLINT UNSIGNED NOT NULL,
    address VARCHAR(100) NOT NULL,
    address_has_script BOOLEAN NOT NULL,
    payment_cred VARBINARY(28),
    stake_address_id BIGINT,
    value BIGINT UNSIGNED NOT NULL,
    data_hash VARBINARY(32),
    multi_assets_descr TEXT NOT NULL,
    inline_datum_id BIGINT,
    reference_script_id BIGINT,
    FOREIGN KEY (tx_id) REFERENCES tx (id),
    FOREIGN KEY (stake_address_id) REFERENCES stake_address (id),
    FOREIGN KEY (inline_datum_id) REFERENCES datum (id),
    FOREIGN KEY (reference_script_id) REFERENCES script (id)
);
