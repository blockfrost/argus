CREATE TABLE multi_asset (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    policy VARBINARY(28) NOT NULL,
    name VARBINARY(32) NOT NULL,
    fingerprint VARCHAR(44) NOT NULL -- CIP14 fingerprint length
);
