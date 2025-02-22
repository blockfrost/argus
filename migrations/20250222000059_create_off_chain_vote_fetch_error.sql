CREATE TABLE off_chain_vote_fetch_error (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    voting_anchor_id BIGINT NOT NULL,
    fetch_error VARCHAR(255) NOT NULL,
    fetch_time DATETIME NOT NULL,
    retry_count INT UNSIGNED NOT NULL,
    FOREIGN KEY (voting_anchor_id) REFERENCES voting_anchor (id)
);
