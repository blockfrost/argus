CREATE TABLE off_chain_vote_author (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    off_chain_vote_data_id BIGINT NOT NULL,
    name VARCHAR(100) NOT NULL,
    witness_algorithm VARCHAR(50) NOT NULL,
    public_key VARCHAR(255) NOT NULL,
    signature VARCHAR(255) NOT NULL,
    warning VARCHAR(255),
    FOREIGN KEY (off_chain_vote_data_id) REFERENCES off_chain_vote_data (id)
);
