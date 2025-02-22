CREATE TABLE off_chain_vote_reference (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    off_chain_vote_data_id BIGINT NOT NULL,
    label VARCHAR(100) NOT NULL,
    uri VARCHAR(255) NOT NULL,
    hash_digest VARCHAR(64),
    hash_algorithm VARCHAR(50),
    FOREIGN KEY (off_chain_vote_data_id) REFERENCES off_chain_vote_data (id)
);
