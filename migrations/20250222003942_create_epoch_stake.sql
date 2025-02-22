CREATE TABLE epoch_stake (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    addr_id BIGINT NOT NULL,
    pool_id BIGINT NOT NULL,
    amount BIGINT UNSIGNED NOT NULL,
    epoch_no INT UNSIGNED NOT NULL,
    FOREIGN KEY (addr_id) REFERENCES stake_address (id),
    FOREIGN KEY (pool_id) REFERENCES pool_hash (id)
)
PARTITION BY
    RANGE (id) (
        PARTITION p0
        VALUES
            LESS THAN (1000000),
            PARTITION p1
        VALUES
            LESS THAN (2000000),
            PARTITION pmax
        VALUES
            LESS THAN (MAXVALUE)
    );
