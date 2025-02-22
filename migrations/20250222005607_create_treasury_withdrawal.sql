CREATE TABLE treasury_withdrawal (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    gov_action_proposal_id BIGINT NOT NULL,
    stake_address_id BIGINT NOT NULL,
    amount BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (gov_action_proposal_id) REFERENCES gov_action_proposal (id),
    FOREIGN KEY (stake_address_id) REFERENCES stake_address (id)
);
