// namespace buyerportal.db;

// using {
//     cuid,
//     managed
// } from '@sap/cds/common';


// context master {

//     type RequestStatus : String enum {
//         open        = 'open';
//         saved       = 'saved';
//         in_approval = 'in_approval';
//         approved    = 'approved';
//     }

//     entity Headers : managed, cuid {
//         PR_Number          : String(10);
//         PRType             : String;
//         StatusCode         : Association to status;
//         _Items             : Composition of many RequestItem
//                                  on _Items._HeaderItem = $self;
//         RequestDescription : String;
//         Comments           : Composition of many comments
//                                  on Comments._HeaderUUID = $self;
//         RequestNo          : String(10)


//     }

//     entity RequestItem : managed, cuid {

//         PRItemNumber        : String(10);
//         Material            : String;
//         MaterialDescription : String;
//         PurOrg              : String;
//         Plant               : String;
//         Status              : String;
//         Quantity            : Integer;
//         UoM                 : String;
//         Price               : Decimal;
//         ReqItemNo           : String;
//         _HeaderItem         : Association to Headers
//     }

//     entity comments : managed {

//         _HeaderUUID : Association to Headers;
//         user        : String

//     }


//     entity status {

//         key id          : String;
//             description : RequestStatus //in-open,approval
//     }
// }


namespace buyerportal.db;

using {
    cuid,
    managed,
    Currency
} from '@sap/cds/common';


context master {

    type RequestStatus : String enum {
        open        = 'open';
        saved       = 'saved';
        in_approval = 'in_approval';
        approved    = 'approved';
    }



    entity Headers : managed, cuid {
        // PR_Number          : String(10);
        // PRType             : String;
        // StatusCode         : Association to status;
        // _Items             : Composition of many RequestItem
        //                          on _Items._HeaderItem = $self;
        // RequestDescription : String;
        // Comments           : Composition of many comments
        //                          on Comments._HeaderUUID = $self;
        // RequestNo          : Integer;
        // Currency           : Currency

        PR_Number : String(10);                                                              // PR number
        StatusCode : Association to status;                                                      // Status Code
        PRType : String;                                                                     // PR type      
        _Items : Composition of many RequestItem on _Items._HeaderItem = $self;                 // items
        RequestDescription : String;                                                        // Request Description
        Comments : Composition of many comments on Comments._HeaderUUID = $self;        // comments
        RequestNo : Integer;     
        Currency :Currency                                                        // Request No
 

    }

    entity RequestItem : managed, cuid {
        // PRItemNumber        : Integer;
        // Material            : String;
        // MaterialDescription : String;
        // PurOrg              : String;
        // Plant               : String;
        // Status              : String;
        // Quantity            : Integer;
        // UoM                 : String;
        // Price               : Decimal;
        // ReqItemNo           : String;
        // _HeaderItem         : Association to Headers

        PRItemNumber : String(10);                // PR number
        Material : String;                          // Material
        MaterialDescription : String;              // Material Description
        PurOrg : String;                            // PurOrg
        Plant  : String;                            // Plant
        Status : String;                            // Status
        Quantity : Integer;                         // Quantity
        UoM : String;                               // Unit of Mass (uom)
        Price : Decimal;                            // Price
        ReqItemNo : Integer;                       // Request Item Number
        _HeaderItem : Association to Headers;
    }

    entity comments :managed{
        _HeaderUUID : Association to Headers;
        user        : String;
    }

    entity status {
        key id          : String;
            description : RequestStatus; // in-open,approval
    }
}
