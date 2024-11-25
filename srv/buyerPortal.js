// const cds = require('@sap/cds');

// module.exports = cds.service.impl(async function () {
//     const { Headers } = this.entities;

//     this.before('CREATE', 'Headers', async (req) => {
//         try {
//             // Ensure Headers entity is correctly referenced
//             if (!Headers) throw new Error('Headers entity is not defined in the service.');

//             // Fetch the maximum RequestNo
//             const result = await cds.run(
//                 SELECT.one
//                     .from(Headers)
//                     .columns({ maxRequestNo: 'max(RequestNo)' })
//             );

//             // Validate the result and set default if necessary
//             const maxRequestNo = result?.maxRequestNo || 999999999;

//             // Increment to get the next RequestNo
//             const nextRequestNo = maxRequestNo + 1;

//             // Assign the new RequestNo to the draft
//             req.data.RequestNo = nextRequestNo;

//             console.log(`Generated RequestNo: ${nextRequestNo}`);
//         } catch (error) {
//             console.error('Error in NEW handler:', error.message);
//             req.reject(500, 'Failed to generate a unique RequestNo.');
//         }
//     });
// });



const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { Headers } = this.entities;

    this.before('CREATE', 'Headers', async (req) => {
        try {
            // Ensure Headers entity is correctly referenced
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

            // Initialize default maxRequestNo
            let maxRequestNo = 999999999;

            // Use an if loop to validate the result and override maxRequestNo
            if (result && result.maxRequestNo) {
                maxRequestNo = result.maxRequestNo;
            }

            // Increment to get the next RequestNo
            const nextRequestNo = maxRequestNo + 1;

            // Assign the new RequestNo to the draft
            req.data.RequestNo = nextRequestNo;

            console.log(`Generated RequestNo: ${nextRequestNo}`);
        } catch (error) {
            console.error('Error in CREATE handler:', error.message);
            req.reject(500, 'Failed to generate a unique RequestNo.');
        }
    });
});
