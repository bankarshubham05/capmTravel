using TravelService as service from '../../srv/travel-service';
using from '../../db/schema';
using {  } from '../../db/master-data';
using {  } from '../../db/common';
using from '@sap/cds/common';



annotate service.TravelEt with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type : 'UI.FieldGroupType',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : createdAt,
            },
            {
                $Type : 'UI.DataField',
                Value : createdBy,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedAt,
            },
            {
                $Type : 'UI.DataField',
                Value : LastChangedBy,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TravelID',
                Value : TravelID,
            },
            {
                $Type : 'UI.DataField',
                Label : 'BeginDate',
                Value : BeginDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'EndDate',
                Value : EndDate,
            },
            {
                $Type : 'UI.DataField',
                Label : 'BookingFee',
                Value : BookingFee,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TotalPrice',
                Value : TotalPrice,
            },
            {
                $Type : 'UI.DataField',
                Label : 'CurrencyCode_code',
                Value : CurrencyCode_code,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Progress',
                Value : Progress,
            },
            {
                $Type : 'UI.DataField',
                Label : 'Description',
                Value : Description,
            },
            {
                $Type : 'UI.DataField',
                Label : 'TravelStatus_code',
                Value : TravelStatus_code,
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
    // Selection Fields

    UI.SelectionFields:[
        
        to_Agency_AgencyID,
        to_Customer_CustomerID,
        BeginDate
        
        
    ],

    // End of Selection fields
    //Start of HeaderInfo

    UI.HeaderInfo : {
        TypeName      : '{i18n>Travel}',
        TypeNamePlural: '{i18n>Travels}',
        Title:{
            $Type : 'UI.DataField',
            Value : Description
        },
        Description :{
            $Type : 'UI.DataField',
            Value : TravelID,
        }
    },

    //End of HeaderInfo
    // List Report Line Item
    UI.LineItem : [
        {
            $Type : 'UI.DataField',
            Value : TravelID,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : to_Customer_CustomerID,
            @UI.Importance : #High,
        },
        {
            $Type : 'UI.DataField',
            Value : BeginDate,
        },
        {
            $Type : 'UI.DataField',
            Value : EndDate,
        },
        {
            $Type : 'UI.DataField',
            Label : 'BookingFee',
            Value : BookingFee,
        },
         {
            $Type : 'UI.DataField',
            Value : TotalPrice,
        },
    ],
    // End of List Report Line Item
);
annotate service.TravelAgency with @(Communication.Contact #contact: {
    $Type: 'Communication.ContactType',
    fn   : Name,
    tel  : [{
        $Type: 'Communication.PhoneNumberType',
        type : #work,
        uri  : PhoneNumber,
    }, ],
    adr  : [{
        $Type   : 'Communication.AddressType',
        type    : #work,
        street  : Street,
        locality: City,
        code    : PostalCode,
        country : CountryCode_code,
    }, ],
});

