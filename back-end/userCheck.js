const User = require("./models/user");
const sequelize = require("./config/db");

async function showUsers() {
  try {
    await sequelize.authenticate();
    const users = await User.findAll();
    console.log("All users:");
    console.log(users.map(u => u.toJSON()));
  } catch (err) {
    console.log("Error:", err);
  }
}

showUsers();
