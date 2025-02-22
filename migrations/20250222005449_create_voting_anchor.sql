CREATE TABLE voting_anchor (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    block_id BIGINT NOT NULL,
    data_hash BLOB NOT NULL,
    url VARCHAR(255) NOT NULL,
    type ENUM (
        'gov_action',
        'drep',
        'other',
        'vote',
        'committee_dereg',
        'constitution'
    ) NOT NULL,
    FOREIGN KEY (block_id) REFERENCES block (id)
);
