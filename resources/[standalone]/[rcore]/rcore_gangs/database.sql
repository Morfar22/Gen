CREATE TABLE `luxuCEXtransactions` (
    `lcex_id` INT(11) NOT NULL AUTO_INCREMENT,
    `lcex_type` VARCHAR(255) NOT NULL,
    `lcex_coin` VARCHAR(255) NOT NULL,
    `lcex_amount` DECIMAL(20,7) NOT NULL,
    `lcex_price` DECIMAL(20,7) NULL,
    `lcex_date` DATETIME NOT NULL DEFAULT current_timestamp,
    `lcex_sender` VARCHAR(255),
    `lcex_receiver` VARCHAR(255),
    `lcex_identifier` VARCHAR(255),
    PRIMARY KEY (`lcex_id`)
) ENGINE=InnoDB;


ALTER TABLE `players` ADD COLUMN `luxucryptoaddress` LONGTEXT NULL;
ALTER TABLE `players` ADD COLUMN `luxucexassets` LONGTEXT NOT NULL DEFAULT '{"BTC": 0,"ETH": 0,"GMT": 0,"BNB": 0,"LUNA": 0,"APE": 0,"XRP": 0,"SOL": 0,"AVAX": 0,"NEAR": 0,"TRX": 0,"MATIC": 0,"SAND": 0,"SHIB": 0,"DOT": 0,"JASMY": 0,"DOGE": 0,"ADA": 0,"ZIL": 0,"FTM": 0,"LINK": 0,"LTC": 0,"PAXG": 0,"GALA": 0,"FIL": 0,"XMR": 0,"ATOM": 0,"EOS": 0,"MANA": 0,"RUNE": 0,"KNC": 0,"WAVES": 0,"ETC": 0,"VET": 0,"FTT": 0,"AAVE": 0,"AXS": 0,"THETA": 0,"BCH": 0,"LRC": 0,"SUSHI": 0,"ZRX": 0,"ZEC": 0,"DYDX": 0,"GRT": 0,"ICP": 0,"KAVA": 0,"XLM": 0,"EGLD": 0,"XTZ": 0}';
ALTER TABLE `players` ADD COLUMN `luxucwbalance` INT(11) NOT NULL DEFAULT '0';
