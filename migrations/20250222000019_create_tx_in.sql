CREATE TABLE tx_in (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    tx_in_id BIGINT NOT NULL,
    tx_out_id BIGINT NOT NULL,
    tx_out_index SMALLINT UNSIGNED NOT NULL,
    redeemer_id BIGINT,
    FOREIGN KEY (tx_in_id) REFERENCES tx (id),
    FOREIGN KEY (tx_out_id) REFERENCES tx (id),
    FOREIGN KEY (redeemer_id) REFERENCES redeemer (id)
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
