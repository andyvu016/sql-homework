-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "card_holder" (
    "cardholder_id" INT   NOT NULL,
    "cardholder_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_card_holder" PRIMARY KEY (
        "cardholder_id"
     )
);

CREATE TABLE "credit_card" (
    "card" VARCHAR(20)   NOT NULL,
    "cardholder_id" INT   NOT NULL,
    CONSTRAINT "pk_credit_card" PRIMARY KEY (
        "card"
     )
);

CREATE TABLE "merchant" (
    "merchant_id" INT   NOT NULL,
    "merchant_name" VARCHAR(255)   NOT NULL,
    "merchant_category_id" INT   NOT NULL,
    CONSTRAINT "pk_merchant" PRIMARY KEY (
        "merchant_id"
     )
);

CREATE TABLE "merchant_category" (
    "merchant_category_id" INT   NOT NULL,
    "merchant_category_name" VARCHAR(255)   NOT NULL,
    CONSTRAINT "pk_merchant_category" PRIMARY KEY (
        "merchant_category_id"
     )
);

CREATE TABLE "transaction" (
    "transaction_id" INT   NOT NULL,
    "date" TIMESTAMP   NOT NULL,
    "amount" FLOAT   NOT NULL,
    "card" VARCHAR(20)   NOT NULL,
    "merchant_id" INT   NOT NULL,
    CONSTRAINT "pk_transaction" PRIMARY KEY (
        "transaction_id"
     )
);

ALTER TABLE "credit_card" ADD CONSTRAINT "fk_credit_card_cardholder_id" FOREIGN KEY("cardholder_id")
REFERENCES "card_holder" ("cardholder_id");

ALTER TABLE "merchant" ADD CONSTRAINT "fk_merchant_merchant_category_id" FOREIGN KEY("merchant_category_id")
REFERENCES "merchant_category" ("merchant_category_id");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_card" FOREIGN KEY("card")
REFERENCES "credit_card" ("card");

ALTER TABLE "transaction" ADD CONSTRAINT "fk_transaction_merchant_id" FOREIGN KEY("merchant_id")
REFERENCES "merchant" ("merchant_id");

