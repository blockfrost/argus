CREATE TABLE constitution (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    gov_action_proposal_id BIGINT NOT NULL,
    voting_anchor_id BIGINT NOT NULL,
    script_hash VARBINARY(28),
    FOREIGN KEY (gov_action_proposal_id) REFERENCES gov_action_proposal (id),
    FOREIGN KEY (voting_anchor_id) REFERENCES voting_anchor (id)
);
