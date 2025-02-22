CREATE TABLE reward (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    type ENUM ('member', 'leader', 'refund') NOT NULL,
    amount BIGINT UNSIGNED NOT NULL,
    earned_epoch BIGINT NOT NULL,
    spendable_epoch BIGINT NOT NULL,
    pool_id BIGINT,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (pool_id) REFERENCES pool_hash (id)
);
