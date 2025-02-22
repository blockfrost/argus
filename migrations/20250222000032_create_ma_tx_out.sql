CREATE TABLE ma_tx_out (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ident BIGINT NOT NULL,
    quantity BIGINT UNSIGNED NOT NULL,
    tx_out_id BIGINT NOT NULL,
    FOREIGN KEY (ident) REFERENCES multi_asset (id),
    FOREIGN KEY (tx_out_id) REFERENCES tx_out (id)
);
