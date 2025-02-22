CREATE TABLE off_chain_vote_data (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    voting_anchor_id BIGINT NOT NULL,
    hash BLOB NOT NULL,
    language VARCHAR(50),
    comment VARCHAR(255),
    json JSON NOT NULL,
    bytes BLOB NOT NULL,
    warning VARCHAR(255),
    is_valid BOOLEAN,
    FOREIGN KEY (voting_anchor_id) REFERENCES voting_anchor (id)
);
