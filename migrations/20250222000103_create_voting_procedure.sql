CREATE TABLE voting_procedure (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tx_id BIGINT NOT NULL,
    `index` INT NOT NULL,
    gov_action_proposal_id BIGINT NOT NULL,
    voter_role ENUM ('ConstitutionalCommittee', 'DRep', 'SPO') NOT NULL,
    committee_voter BIGINT,
    drep_voter BIGINT,
    pool_voter BIGINT,
    vote ENUM ('Yes', 'No', 'Abstain') NOT NULL,
    voting_anchor_id BIGINT,
    invalid BIGINT,
    FOREIGN KEY (tx_id) REFERENCES tx (id),
    FOREIGN KEY (gov_action_proposal_id) REFERENCES gov_action_proposal (id),
    FOREIGN KEY (committee_voter) REFERENCES committee_hash (id),
    FOREIGN KEY (drep_voter) REFERENCES drep_hash (id),
    FOREIGN KEY (pool_voter) REFERENCES pool_hash (id),
    FOREIGN KEY (voting_anchor_id) REFERENCES voting_anchor (id)
);
