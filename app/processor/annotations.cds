using TravelService as service from '../../srv/travel-service';
using from '../../db/schema';
using {} from '../../db/master-data';
using {} from '../../db/common';
using from '@sap/cds/common';
using from './labels';


annotate service.TravelEt with @(
    UI.FieldGroup #GeneratedGroup : {
        $Type: 'UI.FieldGroupType',
      Data : [
    {
        $Type: 'UI.DataField',
        Value: TravelID
    },
    {
        $Type: 'UI.DataField',
        Value: to_Customer_CustomerID
    },
    {
        $Type: 'UI.DataField',
        Value: to_Agency_AgencyID
    },
    {
        $Type: 'UI.DataField',
        Value: Description
    },
    {
        $Type: 'UI.DataField',
        Value: BeginDate
    }
],

    },
    UI.Facets                     : [
        {
            $Type : 'UI.CollectionFacet',
            ID    : 'Travle',
            Label : 'General Information',

            Facets:  [
                { 
                
                    $Type : 'UI.ReferenceFacet',
                    ID    : 'TravelData',
                    Target : '@UI.FieldGroup#GeneratedGroup',
                    Label : '{i18n>GeneralInformation}'
                },
                {
                    $Type               : 'UI.ReferenceFacet',
                    Label               : '{i18n>TravelAdministrativeData}',
                    ID                  : 'i18nTravelAdministrativeData',
                    Target              : '@UI.FieldGroup#i18nTravelAdministrativeData',
                    ![@UI.PartOfPreview]: false,
                }
            ]
        },

        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Bookings',
            Target: 'to_Booking/@UI.LineItem',
            ID    : 'BookingFacet',


        }
    ],
    // Selection Fields

    UI.SelectionFields            : [
        to_Agency_AgencyID,
        to_Customer_CustomerID,
        BeginDate,
        EndDate,
    ],

    // End of Selection fields
    //Start of HeaderInfo

    UI.HeaderInfo                 : {
        TypeName      : '{i18n>Travel}',
        TypeNamePlural: '{i18n>Travels}',
        Title         : {
            $Type: 'UI.DataField',
            Value: Description
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: TravelID,
        }
    },

    //End of HeaderInfo
    // List Report Line Item
  UI.LineItem : [
    {
        $Type         : 'UI.DataField',
        Value         : TravelID,
        @UI.Importance: #High
    },
    {
        $Type         : 'UI.DataField',
        Value         : to_Customer_CustomerID,
        @UI.Importance: #High
    },
    {
        $Type: 'UI.DataField',
        Value: BeginDate
    },
    {
        $Type: 'UI.DataField',
        Label: 'BookingFee',
        Value: BookingFee
    },
    {
        $Type: 'UI.DataField',
        Value: TotalPrice
    },
    {
        $Type         : 'UI.DataField',
        Value         : TravelStatus_code,
        Criticality   : TravelStatus.criticality,
        @UI.Importance: #High
    },
],

    // End of List Report Line Item

    // start of Data point
    UI.DataPoint #TravelStatusCode: {
        $Type      : 'UI.DataPointType',
        Value      : TravelStatus_code,
        Title      : '{i18n>TravelStatus}',
        Criticality: TravelStatus.criticality,

    },


    //End of Data Point
    //HeaderFacet
    UI.HeaderFacets               : [
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TravelStatusCode',
            Target: '@UI.DataPoint#TravelStatusCode',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'TotalPrice',
            Target: '@UI.DataPoint#TotalPrice',
        },
        {
            $Type : 'UI.ReferenceFacet',
            ID    : 'Progress',
            Target: '@UI.DataPoint#progress',
        },
    ]

//End of HF
);

annotate service.TravelEt with @(UI.DataPoint #TotalPrice: {
    $Type: 'UI.DataPointType',
    Value: TotalPrice,
    Title: '{i18n>TotalPrice}',
});

annotate service.TravelEt with @(UI.DataPoint #progress: {
    $Type        : 'UI.DataPointType',
    Value        : Progress,
    Title        : '{i18n>ProgressOfTravel}',
    TargetValue  : 100,
    Visualization: #Progress,
});

annotate service.TravelEt with @(UI.FieldGroup #i18nTravelAdministrativeData: {
    $Type: 'UI.FieldGroupType',
    Data : [
        {
            $Type: 'UI.DataField',
            Value: createdAt,
        },
        {
            $Type: 'UI.DataField',
            Value: LastChangedAt,
        },
        {
            $Type: 'UI.DataField',
            Value: createdBy,
        },
    ],
});


annotate service.Booking with @(

    UI.Facets  : [{
        $Type : 'UI.ReferenceFacet',
        Target: '@UI.LineItem',
    }, ],

    UI.LineItem: [
        {
            Value: to_Carrier.AirlinePicURL,
            Label: '  '
        },
        {
            $Type: 'UI.DataField',
            Value: BookingID
        },
        {
            $Type: 'UI.DataField',
            Value: BookingDate
        },
        {
            $Type: 'UI.DataField',
            Value: to_Customer_CustomerID
        },
        {
            $Type: 'UI.DataField',
            Value: to_Carrier_AirlineID
        },
        {
            $Type: 'UI.DataField',
            Value: ConnectionID,
            Label: '{i18n>FlightNumber}'
        },
        {
            $Type: 'UI.DataField',
            Value: FlightDate
        },
        {
            $Type: 'UI.DataField',
            Value: FlightPrice
        },
        {Value: BookingStatus_code},
    ]

);

annotate service.TravelEt with @(
    UI.DeleteHidden : true,
    UI.CreateHidden : true
) ;




