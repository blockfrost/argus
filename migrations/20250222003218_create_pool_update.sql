CREATE TABLE pool_update (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hash_id BIGINT NOT NULL,
    cert_index INT NOT NULL,
    vrf_key_hash VARBINARY(32) NOT NULL,
    pledge BIGINT UNSIGNED NOT NULL,
    reward_addr_id BIGINT NOT NULL,
    active_epoch_no BIGINT NOT NULL,
    meta_id BIGINT,
    margin DOUBLE NOT NULL,
    fixed_cost BIGINT UNSIGNED NOT NULL,
    deposit BIGINT UNSIGNED,
    registered_tx_id BIGINT NOT NULL,
    FOREIGN KEY (hash_id) REFERENCES pool_hash (id),
    FOREIGN KEY (reward_addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (meta_id) REFERENCES pool_metadata_ref (id),
    FOREIGN KEY (registered_tx_id) REFERENCES tx (id)
);
