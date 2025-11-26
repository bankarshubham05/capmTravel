sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"processor/test/integration/pages/TravelEtList",
	"processor/test/integration/pages/TravelEtObjectPage",
	"processor/test/integration/pages/BookingObjectPage"
], function (JourneyRunner, TravelEtList, TravelEtObjectPage, BookingObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('processor') + '/test/flp.html#app-preview',
        pages: {
			onTheTravelEtList: TravelEtList,
			onTheTravelEtObjectPage: TravelEtObjectPage,
			onTheBookingObjectPage: BookingObjectPage
        },
        async: true
    });

    return runner;
});

