CREATE TABLE pool_retire (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hash_id BIGINT NOT NULL,
    cert_index INT NOT NULL,
    announced_tx_id BIGINT NOT NULL,
    retiring_epoch INT UNSIGNED NOT NULL,
    FOREIGN KEY (hash_id) REFERENCES pool_hash (id),
    FOREIGN KEY (announced_tx_id) REFERENCES tx (id)
);
