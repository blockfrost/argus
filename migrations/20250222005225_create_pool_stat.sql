CREATE TABLE pool_stat (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pool_hash_id BIGINT NOT NULL,
    epoch_no INT UNSIGNED NOT NULL,
    number_of_blocks BIGINT UNSIGNED NOT NULL,
    number_of_delegators BIGINT UNSIGNED NOT NULL,
    stake BIGINT UNSIGNED NOT NULL,
    voting_power BIGINT UNSIGNED NOT NULL,
    FOREIGN KEY (pool_hash_id) REFERENCES pool_hash (id)
);
