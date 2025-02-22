CREATE TABLE redeemer (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tx_id BIGINT NOT NULL,
    unit_mem BIGINT UNSIGNED NOT NULL,
    unit_steps BIGINT UNSIGNED NOT NULL,
    fee BIGINT UNSIGNED,
    purpose ENUM (
        'spend',
        'mint',
        'cert',
        'reward',
        'voting',
        'proposing'
    ) NOT NULL,
    `index` INT UNSIGNED NOT NULL,
    script_hash VARBINARY(28) NOT NULL,
    redeemer_data_id BIGINT,
    FOREIGN KEY (tx_id) REFERENCES tx (id),
    FOREIGN KEY (redeemer_data_id) REFERENCES redeemer_data (id)
);
