const handler = async function () {
  const response = {
    message: `Hello, ${process.env.ATTENDEE_NAME}`,
  };

  return {
    statusCode: 200,
    headers: {
      "Content-Type": "application/json",
      "Access-Control-Allow-Origin": "*",
    },
    body: JSON.stringify(response),
  };
};

module.exports = { handler };
