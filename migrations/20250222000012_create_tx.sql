CREATE TABLE tx (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hash VARBINARY(32) NOT NULL,
    block_id BIGINT NOT NULL,
    block_index INT UNSIGNED NOT NULL,
    out_sum BIGINT UNSIGNED,
    fee BIGINT UNSIGNED,
    deposit BIGINT,
    size INT UNSIGNED NOT NULL,
    invalid_before BIGINT UNSIGNED,
    invalid_hereafter BIGINT UNSIGNED,
    valid_contract BOOLEAN,
    script_size INT UNSIGNED,
    treasury_donation BIGINT UNSIGNED,
    FOREIGN KEY (block_id) REFERENCES block (id)
);
