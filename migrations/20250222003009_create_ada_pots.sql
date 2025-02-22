CREATE TABLE ada_pots (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    slot_no BIGINT UNSIGNED,
    epoch_no INT UNSIGNED,
    treasury BIGINT UNSIGNED,
    reserves BIGINT UNSIGNED,
    rewards BIGINT UNSIGNED,
    utxo BIGINT UNSIGNED,
    deposits_stake BIGINT UNSIGNED,
    deposits_drep BIGINT UNSIGNED,
    deposits_proposal BIGINT UNSIGNED,
    fees BIGINT UNSIGNED,
    block_id BIGINT NOT NULL,
    FOREIGN KEY (block_id) REFERENCES block (id)
);
