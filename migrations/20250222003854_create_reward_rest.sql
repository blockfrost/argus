CREATE TABLE reward_rest (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    type ENUM ('reserves', 'treasury', 'proposal_refund') NOT NULL,
    amount BIGINT UNSIGNED NOT NULL,
    earned_epoch BIGINT NOT NULL,
    spendable_epoch BIGINT NOT NULL,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id)
);
