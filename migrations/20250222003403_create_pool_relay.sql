CREATE TABLE pool_relay (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    update_id BIGINT NOT NULL,
    ipv4 VARCHAR(15), -- e.g., "192.168.1.1"
    ipv6 VARCHAR(45), -- e.g., "2001:0db8::1"
    dns_name VARCHAR(255),
    dns_srv_name VARCHAR(255),
    port INT,
    FOREIGN KEY (update_id) REFERENCES pool_update (id)
);
