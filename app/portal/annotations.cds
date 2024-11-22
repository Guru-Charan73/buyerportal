// using BuyerPortal as service from '../../srv/buyerPortal';

// annotate service.Headers with @(
//     UI.SelectionFields: [
//         PR_Number
//     ],
//     UI.LineItem: [
//         {
//             $Type: 'UI.DataField',
//             Value: RequestNo
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: RequestDescription
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: createdBy
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: _Items.Price // Ensure that _Items and Price are resolvable fields
//         }
//     ],
//     UI.HeaderInfo: {
//         TypeName: 'Status',
//         TypeNamePlural: 'Statuses',
//         Title: {
//             $Type: 'UI.DataField',
//             Value: PR_Number
//         },
//         Description: {
//             $Type: 'UI.DataField',
//             Value: RequestNo
//         },
//         ImageUrl: 'https://tse1.mm.bing.net/th?id=OIP.tla1x5HD0JRb7dzYrO31swHaFO&pid=Api&P=0&h=220'
//     },
//     UI.Facets: [
//         {
//             $Type: 'UI.CollectionFacet',
//             Label: 'General Information',
//             Facets: [
//                 {
//                     $Type: 'UI.ReferenceFacet',
//                     Label: 'General Information',
//                     Target: '@UI.FieldGroup#GeneralInformation' // Ensure this matches the FieldGroup ID
//                 },
                
//             ]
//         },
//         {
//             $Type: 'UI.CollectionFacet',
//             Label: 'Comments',
//             Facets: [
//                 {
//                     $Type: 'UI.ReferenceFacet',
//                     Label: 'Comments',
//                     Target: '@UI.FieldGroup#Comments'
//                 }
//             ]
//         }
//     ],




//     UI.FieldGroup #GeneralInformation: {
//         Label: 'General Information',
//         Data: [
//             {
//                 $Type: 'UI.DataField',
//                 Value: RequestNo
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: _Items.Price // Ensure Price is a valid field under _Items association
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: createdAt
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: createdBy
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: RequestDescription
//             }
//         ]
//     },
//      UI.FieldGroup #Comments:{
//         Data : [
//             {
//                 $Type : 'UI.DataField',
//                 Value : StatusCode_id,
//             },
//             // {
//             //     $Type : 'UI.DataField',
//             //     Value : createdBy,
//             // },
//         ],
//     }    
// );




// using BuyerPortal as service from '../../srv/buyerPortal';

// annotate service.Headers with @(
//     UI.SelectionFields: [
//         RequestNo
//     ],
//     UI.LineItem: [
//         {
//             $Type: 'UI.DataField',
//             Value: RequestNo
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: RequestDescription
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: createdBy
//         },
//         {
//             $Type: 'UI.DataField',
//             Value: _Items.Price // Ensure that _Items is resolvable and Price exists in RequestItem
//         }
//     ],
//     UI.HeaderInfo: {
//         TypeName: 'Status',
//         TypeNamePlural: 'Statuses',
//         Title: {
//             $Type: 'UI.DataField',
//             Value: PR_Number
//         },
//         Description: {
//             $Type: 'UI.DataField',
//             Value: RequestNo
//         },
//         ImageUrl: 'https://tse1.mm.bing.net/th?id=OIP.tla1x5HD0JRb7dzYrO31swHaFO&pid=Api&P=0&h=220'
//     },
//     UI.Facets: [
//         {
//             $Type: 'UI.CollectionFacet',
//             Label: 'General Information',
//             Facets: [
//                 {
//                     $Type: 'UI.ReferenceFacet',
//                     Label: 'General Information',
//                     Target: '@UI.FieldGroup#GeneralInformation'
//                 }
//             ]
//         },
//         {
//             $Type: 'UI.CollectionFacet',
//             Label: 'Comments',
//             Facets: [
//                 {
//                     $Type: 'UI.ReferenceFacet',
//                     Label: 'Comments',
//                     Target: '@UI.FieldGroup#Comments'
//                 }
//             ]
//         }
//     ],
//     UI.FieldGroup #GeneralInformation: {
//         Label: 'General Information',
//         Data: [
//             {
//                 $Type: 'UI.DataField',
//                 Value: RequestNo
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: _Items.Price // Ensure Price is a valid field under _Items association
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: createdAt
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: createdBy
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: RequestDescription
//             }
//         ]
//     },
//     UI.FieldGroup #Comments: {
//         Label: 'Comments',
//         Data: [
//             {
//                 $Type: 'UI.DataField',
//                 Value: Comments.user // Ensure user exists in the Comments entity
//             },
//             {
//                 $Type: 'UI.DataField',
//                 Value: Comments.user // Ensure createdAt exists in the Comments entity
//             }
//         ]
//     }
// );

using BuyerPortal as service from '../../srv/buyerPortal';
annotate service.Headers with @(
    UI.SelectionFields: [
        RequestNo
    ],
    UI.LineItem: [
        {
            $Type: 'UI.DataField',
            Value: RequestNo
        },
        {
            $Type: 'UI.DataField',
            Value: RequestDescription
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy
        },
        {
            $Type: 'UI.DataField',
            Value: _Items.Price
        }
    ],
    UI.HeaderInfo: {
        TypeName: 'Status',
        TypeNamePlural: 'Status',
        Title: {
            $Type: 'UI.DataField',
            Value: RequestNo 
        },
        Description: {
            $Type: 'UI.DataField',
            Value: StatusCode.description // Adjusted for better relevance
        },
        ImageUrl: 'https://tse1.mm.bing.net/th?id=OIP.tla1x5HD0JRb7dzYrO31swHaFO&pid=Api&P=0&h=220' // Use a valid URL or static content
    },
    UI.Facets: [
    {
        $Type: 'UI.ReferenceFacet',
        Label: 'General Information',
        Target: '@UI.FieldGroup#GeneralInformation'
    },
    {
        $Type: 'UI.ReferenceFacet',
        Label: 'Items',
        Target: '@UI.FieldGroup#Items'
    },
    {
        $Type: 'UI.ReferenceFacet',
        Label: 'Comments',
        Target: '@UI.FieldGroup#Comments'
    }
],

UI.FieldGroup #GeneralInformation: {
    Label: 'General Information',
    Data: [
        {
            $Type: 'UI.DataField',
            Value: RequestNo,
            Label: 'Request Number'
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
            Label: 'Created At'
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy,
            Label: 'Created By'
        },
        {
            $Type: 'UI.DataField',
            Value: RequestDescription,
            Label: 'Request Description'
        },
        {
            $Type: 'UI.DataField',
            Value: currency_code,
            Label: 'Currency Code'
        },
        {
            $Type: 'UI.DataField',
            Value: _Items.Price,
            Label: 'Total Price'
        }
    ]
},

UI.FieldGroup #Items: {
    Label: 'Items',
    Data: [
        {
            $Type: 'UI.DataField',
            Value: _Items.PRItemNumber,
            Label: 'Request Item Number'
        },
        {
            $Type: 'UI.DataField',
            Value: _Items.Quantity,
            Label: 'Quantity'
        },
        {
            $Type: 'UI.DataField',
            Value: _Items.Material,
            Label: 'Material'
        },
        {
            $Type: 'UI.DataField',
            Value: _Items.Price,
            Label: 'Unit Price'
        },
        {
            $Type: 'UI.DataField',
            Value: _Items.Plant,
            Label: 'Plant'
        },
        {
            $Type: 'UI.DataField',
            Value: _Items.MaterialDescription,
            Label: 'Material Description'
        }
    ]
},

UI.FieldGroup #Comments: {
    Label: 'Comments',
    Data: [
        {
            $Type: 'UI.DataField',
            Value: Comments.user,
            Label: 'User'
        },
        {
            $Type: 'UI.DataField',
            Value: createdAt,
            Label: 'Comment Created At'
        }
    ]
}
);


