CREATE TABLE epoch_state (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    committee_id BIGINT,
    no_confidence_id BIGINT,
    constitution_id BIGINT NOT NULL,
    epoch_no INT UNSIGNED NOT NULL,
    FOREIGN KEY (committee_id) REFERENCES committee (id),
    FOREIGN KEY (no_confidence_id) REFERENCES gov_action_proposal (id),
    FOREIGN KEY (constitution_id) REFERENCES constitution (id)
);
