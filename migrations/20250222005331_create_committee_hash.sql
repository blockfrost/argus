CREATE TABLE committee_hash (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    raw VARBINARY(28) NOT NULL,
    has_script BOOLEAN NOT NULL
);
