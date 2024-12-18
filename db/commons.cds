namespace Ahameddb.commons;
using { Currency } from '@sap/cds/common';

type Gender : String(1) enum{
    male = 'M';
    female = 'F';
    undisclosed = 'U';
}

type AmountT : Decimal(10, 2)@(
    Semantic.amount.CurrencyCode: 'Currency_code',
    Sap.unit: 'CURRENCY_code'
);

aspect Amount: {
    CURRENCY: Currency;
    GROSS_AMOUNT: AmountT @(title : 'Gross Amount');
    NET_AMOUNT: AmountT @(title : 'Net Amount');
    TAX_AMOUNT: AmountT @(title : 'Tax Amount');
}


// Data Types
type Guid : String(32);

type PhoneNumber : String(30)@assert.format:'^(\+?[1-9]{1}[0-9]{1,3})?[-.\s]?(\(?\d{1,4}\)?[-.\s]?)?(\d{1,4})[-.\s]?\d{1,4}[-.\s]?\d{1,4}$';
type EmailAddress : String(80)@assert.format : '^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';


//Structure
aspect address{
    HOUSENO: Int16;
    STREET: String(32);
    CITY: String(20);
    COUNTRY: String(3);
}