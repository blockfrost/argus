CREATE TABLE reserved_pool_ticker (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(5) NOT NULL,
    pool_hash VARBINARY(28) NOT NULL
);
