CREATE TABLE epoch_stake_progress (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    epoch_no INT UNSIGNED NOT NULL,
    completed BOOLEAN NOT NULL DEFAULT FALSE
);
