namespace ahamed.cds;
using { Ahamed.db.master, Ahamed.db.transaction, ahamed.cds } from './data-model';

// context CDSViews {
//     define view![POWorklist] as 
//     select from transaction.purchaseorder{
//         key PO_ID as![PurchaseOrderNo],
//         key Items.PO_ITEM_POS as![Position],
//         PARTNER_GUID.BP_ID as![VendorId],
//         PARTNER_GUID.COMPANY_NAME as![CompanyName],
//         Items.GROSS_AMOUNT as![GrossAmount],
//         Items.NET_AMOUNT as![NetAmount],
//         Items.TAX_AMOUNT as![TaxAmount],
//         case OVERALL_STATUS
//         when 'N' then 'New'
//         when 'D' then 'Delivered' 
//         when 'P' then 'Pending' 
//         when 'A' then 'Approved' 
//         when 'X' then 'Rejected'
//         end as ![Status],
//         Items.PRODUCT_GUID.DESCRIPTION as![Product],
//         PARTNER_GUID.ADDRESS_GUID.COUNTRY as![Country]
//     };
//     define view![ProductVH] as 
//     select from master.product{
//         @EndUserText.label:[
//             {
//                 language: 'EN',
//                 text: 'Product Id'
//             },
//             {
//                 language: 'DE',
//                 text: 'Prodekt Id'
//             },
//         ]
//         PRODUCT_ID as![ProductId],
//         @EndUserText.label:[
//             {
//                 language: 'EN',
//                 text: 'Product Name'
//             },
//             {
//                 language: 'DE',
//                 text: 'Prodekt Name'
//             },
//         ]
//         DESCRIPTION as![ProductName]
//     };

//     define view![ItemView] as 
//     select from transaction.poitems{
//         PARENT_KEY.PARTNER_GUID.NODE_KEY as![VendorId],
//         PRODUCT_GUID.NODE_KEY as![ProductId],
//         CURRENCY as![Currency],
//         GROSS_AMOUNT as![GrossAmount],
//         NET_AMOUNT as![NetAmount],
//         TAX_AMOUNT as![TaxAmount],
//         PARENT_KEY.OVERALL_STATUS as![Status]
//     };

//     define view![ProductOrders] as select from master.product
//     // Mixin is a keyword provided by CAPM to perform lazy loading
//     // It is same like Association concept in ABAP CDS Views - Lazy loading of dependent data
//     mixin{
//         PO_ORDERS: Association[*] to ItemView on PO_ORDERS.ProductId = $projection.ProductKey
//     }
//     into
//     {
//         NODE_KEY as![ProductKey],
//         DESCRIPTION as![ProductName],
//         PRICE as![Price],
//         SUPPLIER_GUID.BP_ID as![SupplierId],
//         SUPPLIER_GUID.COMPANY_NAME as![SupplierName],
//         SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as![Country],

//         // exposed  association like ABAP which will lazy load orders of a given product
//         //at runtime on demand
//         PO_ORDERS as![ProductItems]
//     }

//     define view![CProductAnalytics] as 
//     select from ProductOrders{
//         ProductName,
//         Country,
//        round(sum(ProductItems.GrossAmount),2) as![TotalPurchaseAmount]: Decimal(10,2),
//         ProductItems.Currency
//     } group by ProductName, Country, ProductItems.Currency

// }

// context CDSViews {

//     define view![POWorklist] as
//         select from transaction.purchaseorder{
//             key PO_ID as![PurchaseOrderId],
//             key Items.PO_ITEM_POS as![ItemPosition],
//             PARTNER_GUID.BP_ID as![PartnerId],
//             PARTNER_GUID.COMPANY_NAME as![CompanyName],
//             GROSS_AMOUNT as![GrossAmount],
//             NET_AMOUNT as![NetAmount],
//             TAX_AMOUNT as![TaxAmount],
//             CURRENCY as![CurrencyCode],
//             OVERALL_STATUS as![Status],
//             Items.PRODUCT_GUID.PRODUCT_ID as![ProductId],
//             Items.PRODUCT_GUID.DESCRIPTION as![ProductName],
//             PARTNER_GUID.ADDRESS_GUID.CITY as![City],
//             PARTNER_GUID.ADDRESS_GUID.COUNTRY as![Country],
//         };

//     define view![ProductValueHelp] as
//     select from master.product{
//         @EndUserText.label:[
//             {
//                 language: 'EN',
//                 text: 'Product id'
//             },
//             {
//                 language: 'DE',
//                 text: 'Prodekt id'
//             }
//         ]
//         PRODUCT_ID as![ProductId],
//         @EndUserText.label:[
//             {
//                 language: 'EN',
//                 text: 'Product Description'
//             },
//             {
//                 language: 'DE',
//                 text: 'Prodekt Description'
//             }
//         ]
//         DESCRIPTION as![Description]
//     };


//     define view![ItemView] as
//     select from transaction.poitems{
//         PARENT_KEY.PARTNER_GUID.NODE_KEY as![CustomerId],
//         PRODUCT_GUID.NODE_KEY as![ProductId],
//         CURRENCY as![CurrencyCode],
//         GROSS_AMOUNT as![GrossAmount],
//         NET_AMOUNT as![NetAmount],
//         TAX_AMOUNT as![TaxAmount],
//         PARENT_KEY.OVERALL_STATUS as![Status]
//     };

//     define view ProductView as select from master.product
//     // Mixin is a keyword to define lose coupling
//     //which will never load items data for product rather load on demand 
//     mixin{
//         //View on view
//         PO_ORDER: Association[*] to ItemView on PO_ORDER.ProductId = $projection.ProductId 
//     } into {
//         NODE_KEY as![ProductId],
//         DESCRIPTION as![Description],
//         CATEGORY as![Category],
//         PRICE as![Price],
//         SUPPLIER_GUID.BP_ID as![SupplierId],
//         SUPPLIER_GUID.COMPANY_NAME as![SupplierName],
//         SUPPLIER_GUID.ADDRESS_GUID.CITY as![City],
//         SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as![Country],
//         //exposed association, at runtime in odata we will see a link to load
//         //dependent data
//         PO_ORDER as![To_Items]
//     };

//     define view CProductValuesView as
//         select from ProductView{
//             ProductId,
//             Country,
//             round(sum(To_Items.GrossAmount),2) as![TotalPurchaseAmount] : Decimal(10,2),
//             To_Items.CurrencyCode as![CurrencyCode]
//         } group by ProductId, Country, To_Items.CurrencyCode;
    
// }


context CDSViews {

    define view![POWorklist] as
        select from transaction.purchaseorder{
            key PO_ID as![PurchaseOrderId],
            key Items.PO_ITEM_POS as![ItemPosition],
            PARTNER_GUID.BP_ID as![PartnerId],
            PARTNER_GUID.COMPANY_NAME as![CompanyName],
            GROSS_AMOUNT as![GrossAmount],
            NET_AMOUNT as![NetAmount],
            TAX_AMOUNT as![TaxAmount],
            CURRENCY as![CurrencyCode],
            OVERALL_STATUS as![Status],
            Items.PRODUCT_GUID.PRODUCT_ID as![ProductId],
            Items.PRODUCT_GUID.DESCRIPTION as![ProductName],
            PARTNER_GUID.ADDRESS_GUID.CITY as![City],
            PARTNER_GUID.ADDRESS_GUID.COUNTRY as![Country],
        };

    
    define view![ProductValueHelp] as
        select from master.product{
        @EndUserText.label:[
            {
                language: 'EN',
                text: 'Product id'
            },
            {
                language: 'DE',
                text: 'Prodekt id'
            }
        ]
        PRODUCT_ID as![ProductId],
        @EndUserText.label:[
            {
                language: 'EN',
                text: 'Product Description'
            },
            {
                language: 'DE',
                text: 'Prodekt Description'
            }
        ]
        DESCRIPTION as![Description]
    };


    define view![ItemView] as
    select from transaction.poitems{
       key PARENT_KEY.PARTNER_GUID.NODE_KEY as![CustomerId],
        PRODUCT_GUID.NODE_KEY as![ProductId],
        CURRENCY as![CurrencyCode],
        GROSS_AMOUNT as![GrossAmount],
        NET_AMOUNT as![NetAmount],
        TAX_AMOUNT as![TaxAmount],
        PARENT_KEY.OVERALL_STATUS as![Status]
    };

    define view ProductView as select from master.product
    // Mixin is a keyword to define lose coupling
    //which will never load items data for product rather load on demand 
    mixin{
        //View on view
        PO_ORDER: Association[*] to ItemView on PO_ORDER.ProductId = $projection.ProductId 
    } into {
        NODE_KEY as![ProductId],
        DESCRIPTION as![Description],
        CATEGORY as![Category],
        PRICE as![Price],
        SUPPLIER_GUID.BP_ID as![SupplierId],
        SUPPLIER_GUID.COMPANY_NAME as![SupplierName],
        SUPPLIER_GUID.ADDRESS_GUID.CITY as![City],
        SUPPLIER_GUID.ADDRESS_GUID.COUNTRY as![Country],
        //exposed association, at runtime in odata we will see a link to load
        //dependent data
        PO_ORDER as![To_Items]
    };

    define view CProductValuesView as
        select from ProductView{
            ProductId,
            Country,
            round(sum(To_Items.GrossAmount),2) as![TotalPurchaseAmount] : Decimal(10,2),
            To_Items.CurrencyCode as![CurrencyCode]
        } group by ProductId, Country, To_Items.CurrencyCode;
    
}