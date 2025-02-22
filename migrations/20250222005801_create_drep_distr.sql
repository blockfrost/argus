CREATE TABLE drep_distr (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hash_id BIGINT NOT NULL,
    amount BIGINT NOT NULL,
    epoch_no INT UNSIGNED NOT NULL,
    active_until INT UNSIGNED,
    FOREIGN KEY (hash_id) REFERENCES drep_hash (id)
);
