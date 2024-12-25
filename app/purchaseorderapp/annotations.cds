using CatalogService.POs as service from '../../srv/CatalogService';
annotate CatalogService.POs with @(


UI : {
    // Filter 
    SelectionFields           : [
        PO_ID,
        GROSS_AMOUNT,
        LIFECYCLE_STATUS,
        CURRENCY_code,
        PARTNER_GUID.COMPANY_NAME
    ],
    LineItem                  : [
        {
            $Type : 'UI.DataField',  
            Value : PO_ID,          
            // Label: 'Purchase Order',
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT,
        },
        {
            $Type                     : 'UI.DataField',
            Value                     : OVERALL_STATUS,
            Criticality               : Crtiticality,
            CriticalityRepresentation : #WithIcon
        },
        {
            $Type : 'UI.DataFieldForAction',
            Label : 'Boost',
            Action : 'CatalogService.boost',
            Inline: true
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code,
            Label: 'Currency',
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.COMPANY_NAME,
        },
        {
            $Type : 'UI.DataField',
            Value : PARTNER_GUID.ADDRESS_GUID.COUNTRY,
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT,
        }
    ],
    HeaderInfo                : {
        $Type          : 'UI.HeaderInfoType',
        TypeName       : 'Purchase Order',
        TypeNamePlural : 'Purchase Orders',
        Title          : {
            Label : 'Purchase Order Id',
            Value : PO_ID
        },
        Description    : {
            Label : 'Supplier',
            Value : PARTNER_GUID.COMPANY_NAME
        },
        ImageUrl       : 'https://upload.wikimedia.org/wikipedia/commons/thumb/5/59/SAP_2011_logo.svg/2560px-SAP_2011_logo.svg.png'
    },
    Facets                    : [{
        $Type : 'UI.CollectionFacet',
        Label : 'Details',
        Facets : [
            {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'More Details',
                Target : ![@UI.FieldGroup#AhamedFields]
            },
            {
                $Type : 'UI.ReferenceFacet',
                Label : 'Status',
                Target : ![@UI.FieldGroup#StatusGroup]
            },
           {
                $Type  : 'UI.ReferenceFacet',
                Label  : 'Amounts',
                Target : ![@UI.FieldGroup#SecondGroup]
            }
        ],
    },
    {
        $Type : 'UI.ReferenceFacet',
        Label : 'Line Items',
        Target : Items.![@UI.LineItem]
    },
    ],
    FieldGroup #SecondGroup   : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code
            },
        ]
    },

    FieldGroup  #StatusGroup: {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
            },
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS,
            },
        ]
    },

    FieldGroup #AhamedFields : {
        $Type : 'UI.FieldGroupType',
        Data  : [
            {
                $Type : 'UI.DataField',
                Value : PO_ID
            },
            {
                $Type : 'UI.DataField',
                Value : PARTNER_GUID_NODE_KEY,
                Label : 'Product' 
            },
            {
                $Type : 'UI.DataField',
                Value : OVERALL_STATUS,
                Label : 'Status'
            },

            // {
            //     $Type : 'UI.DataField',
            //     Value : PARTNER_GUID.BP_ID
            // },
            // {
            //     $Type : 'UI.DataField',
            //     Value : PARTNER_GUID.COMPANY_NAME
            // },

            // {
            //     $Type : 'UI.DataField',
            //     Value : LIFECYCLE_STATUS,
            //     Label : 'Lifecycle Status'
            // }
        ]
    },
}


);

// annotate CatalogService.POs with {
//     PARTNER_GUID@(
//         Common : { 
//             Text : PARTNER_GUID.COMPANY_NAME,
//          },
//          ValueList.entity: CatalogService.BusinessPartnerSet
//     )
// };

// annotate CatalogService.POItems with {
//     PRODUCT_GUID@(
//         Common : { 
//             Text : PRODUCT_GUID.DESCRIPTION,
//          },
//          ValueList.entity: CatalogService.ProductSet
//     )
// };

// @cds.odata.valuelist
// annotate CatalogService.BusinessPartnerSet with @(
//     UI.Identification:[{
//         $Type : 'UI.DataField',
//         Value : COMPANY_NAME,
//         Label : 'Company',
//     }]
// );

// @cds.odata.valuelist
// annotate CatalogService.ProductSet with @(
//     UI.Identification:[{
//         $Type : 'UI.DataField',
//         Value : DESCRIPTION,
//     }]
// );

annotate CatalogService.POItems with @(
    UI: {
        LineItem  : [
            {
                $Type: 'UI.DataField',
                Value : PO_ITEM_POS,
            },
            {
                $Type: 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            {
                $Type: 'UI.DataField',
                Value : PRODUCT_GUID.NODE_KEY,
            },
            {
                $Type: 'UI.DataField',
                Value : GROSS_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value : NET_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value : TAX_AMOUNT,
            },
            {
                $Type: 'UI.DataField',
                Value : CURRENCY_code,
            },
        ],
        HeaderInfo  : {
            $Type : 'UI.HeaderInfoType',
            TypeName : 'Item',
            TypeNamePlural : 'Items',
            Title:{
                $Type: 'UI.DataField',
                Value : PRODUCT_GUID_NODE_KEY,
            },
            Description:{
                $Type : 'UI.DataField',
                Value: PO_ITEM_POS
            }
        },
        // Facets  : [
        //     {
        //         $Type : 'UI.ReferenceFacet',
        //         Target : '@UI.FieldGroup#LineItemHeader',
        //         Label : 'More info',
        //     },
        //     {
        //         $Type : 'UI.ReferenceFacet',
        //         Target : '@UI.FieldGroup#ProductDetails',
        //         Label : 'Product Info',
        //     },
        // ],
        FieldGroup#LineItemHeader  : {
            $Type : 'UI.FieldGroupType',
            Data : [

                {
                    $Type : 'UI.DataField',
                    Value : PO_ITEM_POS,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID_NODE_KEY,
                },
                {
                    $Type : 'UI.DataField',
                    Value : GROSS_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : NET_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : TAX_AMOUNT,
                },
                {
                    $Type : 'UI.DataField',
                    Value : CURRENCY_code,
                }
            ],
        },
        FieldGroup#ProductDetails  : {
            $Type : 'UI.FieldGroupType',
            Data: [

                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.PRODUCT_ID,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.DESCRIPTION,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.TYPE_CODE,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.CATEGORY,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.SUPPLIER_GUID.COMPANY_NAME,
                },
                {
                    $Type : 'UI.DataField',
                    Value : PRODUCT_GUID.TAX_TARIF_CODE,
                }
            ]
        },
    }
);

annotate CatalogService.POs with @(

){
    
    PO_ID @title : 'Purchase Order';
    OVERALL_STATUS @title: 'Overall Status';
    LIFECYCLE_STATUS @title : 'Lifecycle Status';
}

annotate CatalogService.BusinessPartnerSet with @(

){
    
    COMPANY_NAME @title : 'Company';
    NODE_KEY @title : 'Product'
    
}

annotate CatalogService.AddressSet with @(
    
){
    COUNTRY @title : 'Country';
};

annotate CatalogService.ProductSet with @(
 ){
    PRODUCT_ID @title : 'ProductID'
 } ;
 
  
// Value Help
@cds.odata.valuelist
annotate service.BusinessPartnerSet with @(
UI.Identification:[
    {
                    $Type : 'UI.DataField',
                    Value : COMPANY_NAME,
                }
]
);
@cds.odata.valuelist
annotate service.ProductSet with  @(
UI.Identification:[
    {
                    $Type : 'UI.DataField',
                    Value : DESCRIPTION,
                }
]
);
// After creating value help . we have to link it with the field where the Value help has to appear
annotate service.POs with {
    PARTNER_GUID@(
        common.Text: PARTNER_GUID.COMPANY_NAME,
        Common.valuelist.entity: service.BusinessPartnerSet
    );
};

annotate service.POItems with {
    PRODUCT_GUID@(
        common.Text: PRODUCT_GUID.DESCRIPTION,
        Common.valuelist.entity: service.ProductSet
    );
};
