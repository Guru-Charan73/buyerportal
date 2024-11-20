using BuyerPortal as service from '../../srv/buyerPortal';
annotate service.Headers with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Label : 'PR_Number',
                Value : PR_Number,
            },
            {
                $Type : 'UI.DataField',
                Label : 'PRType',
                Value : PRType,
            },
            {
                $Type : 'UI.DataField',
                Label : 'StatusCode_id',
                Value : StatusCode_id,
            },
            {
                $Type : 'UI.DataField',
                Label : 'RequestDescription',
                Value : RequestDescription,
            },
            {
                $Type : 'UI.DataField',
                Label : 'RequestNo',
                Value : RequestNo,
            },
        ],
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            ID : 'GeneratedFacet1',
            Label : 'General Information',
            Target : '@UI.FieldGroup#GeneratedGroup',
        },
    ],
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Label : 'PR_Number',
            Value : PR_Number,
        },
        {
            $Type : 'UI.DataField',
            Label : 'PRType',
            Value : PRType,
        },
        {
            $Type : 'UI.DataField',
            Label : 'StatusCode_id',
            Value : StatusCode_id,
        },
        {
            $Type : 'UI.DataField',
            Label : 'RequestDescription',
            Value : RequestDescription,
        },
        {
            $Type : 'UI.DataField',
            Label : 'RequestNo',
            Value : RequestNo,
        },
    ],
);

annotate service.Headers with {
    StatusCode @Common.ValueList : {
        $Type : 'Common.ValueListType',
        CollectionPath : 'status',
        Parameters : [
            {
                $Type : 'Common.ValueListParameterInOut',
                LocalDataProperty : StatusCode_id,
                ValueListProperty : 'id',
            },
            {
                $Type : 'Common.ValueListParameterDisplayOnly',
                ValueListProperty : 'description',
            },
        ],
    }
};

