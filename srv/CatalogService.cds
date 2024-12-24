using { Ahamed.db.master, Ahamed.db.transaction } from '../db/data-model';

service CatalogService @(path: 'CatalogService') {
    @capabilities:{Deletable}
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    // @readonly
    entity EmployeeSet as projection on master.employees;
    entity ProductSet as projection on master.product;
    function dft_status() returns POs;
    
    entity POs @(
        title: 'Purchase order',
        odata.draft.enabled : true,
        Common.DefaultValuesFunction: 'dft_status'
    ) as projection on transaction.purchaseorder{
        *,
        case OVERALL_STATUS
            when 'N' then 'New'
            when 'B' then 'Blocked'
            when 'D' then 'Delivered'
            when 'P' then 'Planned'
        end as OVERALL_STATUS: String(20),
        case OVERALL_STATUS
            when 'N' then 2
            when 'B' then 1
            when 'D' then 3
            when 'P' then 3
            end as Crtiticality: Integer,
        //round(GROSS_AMOUNT) as GROSS_AMOUNT: Decimal(10,2),
        Items: redirected to POItems
    }
    actions{
        action boost() returns POs;
        function largestOrder() returns POs;
    };
    entity POItems as projection on transaction.poitems;
}


