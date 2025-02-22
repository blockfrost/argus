CREATE TABLE slot_leader (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hash VARBINARY(28) NOT NULL,
    pool_hash_id BIGINT,
    description VARCHAR(255) NOT NULL,
    FOREIGN KEY (pool_hash_id) REFERENCES pool_hash (id)
);
