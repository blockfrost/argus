CREATE TABLE block (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    hash VARBINARY(32) NOT NULL,
    epoch_no INT UNSIGNED,
    slot_no BIGINT UNSIGNED,
    epoch_slot_no INT UNSIGNED,
    block_no INT UNSIGNED,
    previous_id BIGINT,
    slot_leader_id BIGINT NOT NULL,
    size INT UNSIGNED NOT NULL,
    time DATETIME NOT NULL,
    tx_count BIGINT NOT NULL,
    proto_major INT UNSIGNED NOT NULL,
    proto_minor INT UNSIGNED NOT NULL,
    vrf_key VARCHAR(255),
    op_cert VARBINARY(32),
    op_cert_counter BIGINT UNSIGNED,
    FOREIGN KEY (previous_id) REFERENCES block (id),
    FOREIGN KEY (slot_leader_id) REFERENCES slot_leader (id)
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
