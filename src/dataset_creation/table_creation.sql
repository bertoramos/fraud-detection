
DROP TABLE IF EXISTS CERTS;
DROP TABLE IF EXISTS PAYMENT_METHODS;
DROP TABLE IF EXISTS SSL_ISSUER;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS SHOPS;

CREATE TABLE IF NOT EXISTS SHOPS (
	shop_id integer PRIMARY KEY,
    domain_url varchar(255) NOT NULL,
    domain_registration_date DATETIME,
    is_young_domain BOOLEAN NOT NULL,
    contact_email BOOLEAN NOT NULL,
    logo_url BOOLEAN NOT NULL,
    legitimate BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS PAYMENT_METHODS (
	payment_method_id INTEGER PRIMARY KEY,
    allow_credit_card BOOL NOT NULL,
    allow_money_back BOOL NOT NULL,
    allow_cash_on_delivery BOOL NOT NULL,
    allow_crypto BOOL NOT NULL,
    shop_id INTEGER,
    FOREIGN KEY (shop_id) REFERENCES SHOPS(shop_id)
);

CREATE TABLE IF NOT EXISTS SSL_ISSUER (
	ssl_id INTEGER PRIMARY KEY,
    ssl_issuer VARCHAR(255) NOT NULL,
    ssl_organization VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS REVIEW (
	review_id INTEGER PRIMARY KEY,
    trust_pilot_score INTEGER,
    site_jabber_review BOOL,
    tranco_rank INTEGER,
    shop_id INTEGER,
    FOREIGN KEY (shop_id) REFERENCES SHOPS(shop_id)
);

CREATE TABLE IF NOT EXISTS CERTS (
	cert_id INTEGER PRIMARY KEY,
    cert_expire_date DATETIME NOT NULL,
    shop_id INTEGER,
    ssl_id INTEGER,
    FOREIGN KEY (shop_id) REFERENCES SHOPS(shop_id),
    FOREIGN KEY (ssl_id) REFERENCES SSL_ISSUER(ssl_id)
);
