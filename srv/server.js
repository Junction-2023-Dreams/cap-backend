const cds = require("@sap/cds");
let app;

cds.on("bootstrap", async (a) => {
  app = a;
  app.use((req, res, next) => {
    const {
      headers: { origin },
      path,
    } = req;

    if (origin)
      res
        .set("Access-Control-Allow-Origin", "*")
        .set("Access-Control-Allow-Headers", "Content-Type,Authorization");
    // preflight request
    if (origin && req.method === "OPTIONS")
      return res
        .set("Access-Control-Allow-Methods", "GET,HEAD,PUT,PATCH,POST,DELETE")
        .end();

    next();
  });
});

cds.on("served", () => {});

module.exports = cds.server;