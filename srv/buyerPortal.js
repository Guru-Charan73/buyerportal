// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function () {
//     const { Headers } = this.entities;

//     // When a new draft is created
//     this.on('NEW', 'Headers.draft', async (req) => {
//         try {
//             // Start a database transaction
//             const tx = cds.tx(req);

//             // Fetch the current maximum value of "Request Item Number"
//             const maxItemNumber = await tx.run(
//                 SELECT.one('RequestNo')
//                     .from(Headers)
//                     .orderBy({ Request_Item_Number: 'desc' })
//             );

//             // Calculate the next "Request Item Number"
//             const nextItemNumber = maxItemNumber ? maxItemNumber.RequestNo + 1 : 1;

//             // Set the incremented value in the incoming draft data
//             req.data.RequestNo = nextItemNumber;

//             console.log(`New draft created with Request Item Number: ${nextItemNumber}`);

//             // Return the draft data with the updated field
//             return req.data;
//         } catch (error) {
//             console.error('Error while handling NEW draft event:', error);
//             req.error(500, 'Unable to create draft with incremented Request Item Number');
//         }
//     });
// });


// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function () {
//     const { Headers } = this.entities;

//     // Event handler for creating a new draft for Headers
//     this.before('NEW', 'Headers.draft', async (req) => {
//         try {
//             // Start a database transaction
//             const tx = cds.tx(req);

//             // Fetch the current maximum value of "RequestNo"
//             const [maxRequestNo] = await tx.run(
//                 SELECT.from(Headers)
//                     .columns('RequestNo')
//                     .orderBy({ RequestNo: 'desc' })
//                     .limit(1) // Ensures we only get the latest RequestNo
//             );

//             // Calculate the next "RequestNo"
//             const nextRequestNo = maxRequestNo ? maxRequestNo.RequestNo + 1 : 1000000000;

//             // Set the incremented value in the incoming draft data
//             req.data.RequestNo = nextRequestNo;

//             // Log the next RequestNo for debugging purposes
//             console.log(`New draft created with RequestNo: ${nextRequestNo}`);

//             // Return the draft data with the updated RequestNo
//             return req.data;
//         } catch (error) {
//             // Log the error and return a 500 error response
//             console.error('Error while handling NEW draft event for Headers:', error);
//             req.error(500, 'Unable to create draft with incremented RequestNo');
//         }
//     });
// });






// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function () {
//     const { Headers } = this.entities;

//     // Event handler for creating a new draft for Headers
//     this.before('NEW','Headers.draft', async (req) => {
//         try {
//             // Start a transaction
//             const tx = cds.transaction(req);

//             // Fetch the current maximum value of "RequestNo"
//             const maxRequestNoRecord = await tx.run(
//                 SELECT.one('RequestNo')
//                     .from(Headers)
//                     .orderBy({ RequestNo: 'desc' })
//             );

//             // Ensure the record exists and default if not
//             const currentMaxRequestNo = maxRequestNoRecord?.RequestNo ?? 999999999;

//             // Ensure currentMaxRequestNo is a valid number
//             if (isNaN(currentMaxRequestNo)) {
//                 req.error(500, 'Invalid RequestNo value in database');
//                 return;
//             }

//             // Calculate the next "RequestNo"
//             const nextRequestNo = currentMaxRequestNo + 1;

//             // Assign the incremented value to the incoming draft data
//             req.data.RequestNo = nextRequestNo;

//             // Log for debugging purposes
//             console.log(`New draft created with RequestNo: ${nextRequestNo}`);
//         } catch (error) {
//             // Log the error
//             console.error('Error while handling NEW draft event for Headers:', error);

//             // Respond with a generic error message
//             req.error(500, 'Unable to create draft with incremented RequestNo');
//         }
//     });
// });



const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Headers } = this.entities;

    this.before('NEW', 'Headers.draft', async (req) => {
        try {
            // Fetch the current maximum value of "RequestNo"
            const result = await SELECT.one
                .from(Headers)
                .columns({ RequestNo: 'max(RequestNo)' });

            // Safeguard: Handle cases where result might be null or undefined
            const maxRequestNo = result?.RequestNo || 0;

            // Calculate the next "RequestNo"
            const nextRequestNo = maxRequestNo + 1 || 1000000000;

            // Assign the incremented value to the incoming draft
            req.data.RequestNo = nextRequestNo;

            console.log(`New draft created with RequestNo: ${nextRequestNo}`);
        } catch (error) {
            // Log and reject the request with an error
            console.error('Error while creating draft:', error);
            req.reject(500, 'Unable to generate a new RequestNo for the draft');
        }
    });
});
