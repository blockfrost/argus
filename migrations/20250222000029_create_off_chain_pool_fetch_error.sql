CREATE TABLE off_chain_pool_fetch_error (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    pool_id BIGINT NOT NULL,
    fetch_time DATETIME NOT NULL,
    pmr_id BIGINT NOT NULL,
    fetch_error VARCHAR(255) NOT NULL,
    retry_count INT UNSIGNED NOT NULL,
    FOREIGN KEY (pool_id) REFERENCES pool_hash (id),
    FOREIGN KEY (pmr_id) REFERENCES pool_metadata_ref (id)
);
