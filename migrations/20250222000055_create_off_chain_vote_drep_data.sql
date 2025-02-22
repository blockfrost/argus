CREATE TABLE off_chain_vote_drep_data (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    off_chain_vote_data_id BIGINT NOT NULL,
    payment_address VARCHAR(100),
    given_name VARCHAR(100) NOT NULL,
    objectives TEXT,
    motivations TEXT,
    qualifications TEXT,
    image_url VARCHAR(255),
    image_hash VARCHAR(64),
    FOREIGN KEY (off_chain_vote_data_id) REFERENCES off_chain_vote_data (id)
);
