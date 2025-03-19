
LOAD DATA LOCAL INFILE 'D:/AWS/fraud-detection/data/fraudulent_online_shops_database/shops.csv'
INTO TABLE SHOPS
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@shop_id, @domain_url, @domain_registration_date, @is_young_domain, @contact_email, @logo_url, @legitimate)
SET 
   shop_id = NULLIF(@shop_id, ''),
   domain_url = NULLIF(@domain_url, ''),
   domain_registration_date = NULLIF(@domain_registration_date, ''),
   is_young_domain = NULLIF(@is_young_domain, ''),
   contact_email = NULLIF(@contact_email, ''),
   logo_url = NULLIF(@logo_url, ''),
   legitimate = NULLIF(@legitimate, '');
   
LOAD DATA LOCAL INFILE 'D:/AWS/fraud-detection/data/fraudulent_online_shops_database/review.csv'
INTO TABLE REVIEW
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@trust_pilot_score, @site_jabber_review, @tranco_rank, @shop_id, @review_id)
SET
	review_id = NULLIF(@review_id, ''),
	shop_id = NULLIF(@shop_id, ''),
   trust_pilot_score = NULLIF(@trust_pilot_score, ''),
   site_jabber_review = NULLIF(@site_jabber_review, ''),
   tranco_rank = NULLIF(@tranco_rank, ''),
	shop_id = NULLIF(@shop_id, '');

LOAD DATA LOCAL INFILE 'D:/AWS/fraud-detection/data/fraudulent_online_shops_database/payment_methods.csv'
INTO TABLE PAYMENT_METHODS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@allow_credit_card, @allow_money_back, @allow_cash_on_delivery, @allow_crypto, @shop_id, @payment_method_id)
SET
	payment_method_id = NULLIF(@payment_method_id, ''),
   allow_credit_card = NULLIF(@allow_credit_card, ''),
   allow_money_back = NULLIF(@allow_money_back, ''),
   allow_cash_on_delivery = NULLIF(@allow_cash_on_delivery, ''),
	allow_crypto = NULLIF(@allow_crypto, ''),
	shop_id = NULLIF(@shop_id, '');

LOAD DATA LOCAL INFILE 'D:/AWS/fraud-detection/data/fraudulent_online_shops_database/ssl_issuer.csv'
INTO TABLE SSL_ISSUER
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@ssl_organization, @ssl_issuer, @ssl_id)
SET
	ssl_id = NULLIF(@ssl_id, ''),
   ssl_issuer = NULLIF(@ssl_issuer, ''),
   ssl_organization = NULLIF(@ssl_organization, '');

LOAD DATA LOCAL INFILE 'D:/AWS/fraud-detection/data/fraudulent_online_shops_database/certs.csv'
INTO TABLE CERTS
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(@shop_id_fk, @ssl_id_fk, @cert_expire_date, @cert_id)
SET
	cert_id = NULLIF(@cert_id, ''),
   cert_expire_date = NULLIF(@cert_expire_date, ''),
   shop_id = NULLIF(@shop_id_fk, ''),
	ssl_id = NULLIF(@ssl_id_fk, '');
