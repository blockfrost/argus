CREATE TABLE ma_tx_mint (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    ident BIGINT NOT NULL,
    quantity BIGINT NOT NULL,
    tx_id BIGINT NOT NULL,
    FOREIGN KEY (ident) REFERENCES multi_asset (id),
    FOREIGN KEY (tx_id) REFERENCES tx (id)
);
