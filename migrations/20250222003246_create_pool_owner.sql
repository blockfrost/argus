CREATE TABLE pool_owner (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    pool_update_id BIGINT NOT NULL,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (pool_update_id) REFERENCES pool_update (id)
);
