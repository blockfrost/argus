CREATE TABLE blocks (
    slot BIGINT NOT NULL,
    hash BINARY(32) NOT NULL,
    cbor BLOB NOT NULL
);
