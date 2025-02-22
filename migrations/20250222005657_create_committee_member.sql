CREATE TABLE committee_member (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    committee_id BIGINT NOT NULL,
    committee_hash_id BIGINT NOT NULL,
    expiration_epoch INT UNSIGNED NOT NULL,
    FOREIGN KEY (committee_id) REFERENCES committee (id),
    FOREIGN KEY (committee_hash_id) REFERENCES committee_hash (id)
);
