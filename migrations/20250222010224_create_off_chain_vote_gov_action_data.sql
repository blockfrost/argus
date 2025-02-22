CREATE TABLE off_chain_vote_gov_action_data (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    off_chain_vote_data_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    abstract TEXT NOT NULL,
    motivation TEXT NOT NULL,
    rationale TEXT NOT NULL,
    FOREIGN KEY (off_chain_vote_data_id) REFERENCES off_chain_vote_data (id)
);
