CREATE TABLE epoch (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    out_sum DECIMAL(39, 0) UNSIGNED, -- 128-bit equivalent
    fees BIGINT UNSIGNED,
    tx_count INT UNSIGNED NOT NULL,
    blk_count INT UNSIGNED NOT NULL,
    no INT UNSIGNED NOT NULL,
    start_time DATETIME NOT NULL,
    end_time DATETIME NOT NULL
);
