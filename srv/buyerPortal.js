// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function () {
//     const { Headers } = this.entities;

//     this.before('CREATE', 'Headers', async (req) => {
//         try {
//             // Ensure Headers entity is correctly referenced
//             if (!Headers) {
//                 req.reject(500, 'Headers entity is not defined in the service.');
//                 return;
//             }

//             // Fetch the maximum RequestNo
//             const result = await cds.run(
//                 SELECT.one
//                     .from(Headers)
//                     .columns({ maxRequestNo: 'max(RequestNo)' })
//             );

//             // Initialize default maxRequestNo
//             let maxRequestNo = 999999999;

//             // Use an if loop to validate the result and override maxRequestNo
//             if (result && result.maxRequestNo) {
//                 maxRequestNo = result.maxRequestNo;
//             }

//             // Increment to get the next RequestNo
//             const nextRequestNo = maxRequestNo + 1;

//             // Assign the new RequestNo to the draft
//             req.data.RequestNo = nextRequestNo;

//             console.log(`Generated RequestNo: ${nextRequestNo}`);
//         } catch (error) {
//             console.error('Error in CREATE handler:', error.message);
//             req.reject(500, 'Failed to generate a unique RequestNo.');
//         }
//     });
// });


const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Headers, Request_Items } = this.entities;

    // Handler for Headers entity
    this.before('CREATE', 'Headers', async (req) => {
        try {
            if (!Headers) {
                req.reject(500, 'Headers entity is not defined in the service.');
                return;
            }

            // Fetch the maximum RequestNo
            const result = await cds.run(
                SELECT.one
                    .from(Headers)
                    .columns({ maxRequestNo: 'max(RequestNo)' })
            );

            // Initialize and set default maxRequestNo
            let maxRequestNo = 999999999;
            if (result && result.maxRequestNo) {
                maxRequestNo = result.maxRequestNo;
            }

            // Increment RequestNo
            const nextRequestNo = maxRequestNo + 1;
            req.data.RequestNo = nextRequestNo;

            console.log(`Generated RequestNo: ${nextRequestNo}`);
        } catch (error) {
            console.error('Error in Headers CREATE handler:', error.message);
            req.reject(500, 'Failed to generate a unique RequestNo.');
        }
    });

    // Handler for Request_Items entity
    this.before('CREATE', 'Request_Items', async (req) => {
        try {
            if (!Request_Items) {
                req.reject(500, 'Request_Items entity is not defined in the service.');
                return;
            }

            // Fetch the maximum PritemNo
            const result = await cds.run(
                SELECT.one
                    .from(Request_Items)
                    .columns({ maxPritemNo: 'max(PritemNo)' })
            );

            // Initialize and set default maxPritemNo
            let maxPritemNo = 0;
            if (result && result.maxPritemNo) {
                maxPritemNo = result.maxPritemNo;
            }

            // Increment PritemNo
            const nextPritemNo = maxPritemNo + 1;
            req.data.PritemNo = nextPritemNo;

            console.log(`Generated PritemNo: ${nextPritemNo}`);
        } catch (error) {
            console.error('Error in Request_Items CREATE handler:', error.message);
            req.reject(500, 'Failed to generate a unique PritemNo.');
        }
    });
});
