CREATE TABLE committee (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    gov_action_proposal_id BIGINT,
    quorum_numerator BIGINT NOT NULL,
    quorum_denominator BIGINT NOT NULL,
    FOREIGN KEY (gov_action_proposal_id) REFERENCES gov_action_proposal (id)
);
