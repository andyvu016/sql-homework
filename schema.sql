
-- Create tables with the corresponding columns for each csv file.
CREATE TABLE "card_holder" (
    cardholder_id INT   NOT NULL,
    cardholder_name VARCHAR(255)   NOT NULL,
    PRIMARY KEY (cardholder_id)
);

CREATE TABLE "credit_card" (
    card VARCHAR(20)   NOT NULL,
    cardholder_id INT   NOT NULL,
    PRIMARY KEY (card),
	FOREIGN KEY (cardholder_id) REFERENCES card_holder(cardholder_id)
);

CREATE TABLE "merchant_category" (
    merchant_category_id INT   NOT NULL,
    merchant_category_name VARCHAR(255)   NOT NULL,
    PRIMARY KEY (merchant_category_id)
);

CREATE TABLE "merchant" (
    merchant_id INT   NOT NULL,
    merchant_name VARCHAR(255)   NOT NULL,
    merchant_category_id INT   NOT NULL,
    PRIMARY KEY (merchant_id),
	FOREIGN KEY (merchant_category_id) REFERENCES merchant_category(merchant_category_id)
);

CREATE TABLE "transaction" (
    transaction_id INT   NOT NULL,
    date TIMESTAMP   NOT NULL,
    amount FLOAT   NOT NULL,
    card VARCHAR(20)   NOT NULL,
    merchant_id INT   NOT NULL,
	PRIMARY KEY (transaction_id),
	FOREIGN KEY (card) REFERENCES credit_card(card),
	FOREIGN KEY (merchant_id) REFERENCES merchant(merchant_id)
);


