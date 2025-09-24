const { Sequelize } = require("sequelize");
const path = require("path");

const sequelize = new Sequelize({
  dialect: "sqlite",
  storage: path.join(__dirname, "../database.sqlite")
});

sequelize.authenticate()
  .then(() => console.log("Database connected"))
  .catch((err) => console.log("Error: " + err));

module.exports = sequelize;
