CREATE TABLE off_chain_vote_external_update (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    off_chain_vote_data_id BIGINT NOT NULL,
    title VARCHAR(255) NOT NULL,
    uri VARCHAR(255) NOT NULL,
    FOREIGN KEY (off_chain_vote_data_id) REFERENCES off_chain_vote_data (id)
);
