const express = require("express");
const cors = require("cors");
const authRoutes = require("./routes/authRoutes");

const app = express();
app.use(cors());
app.use(express.json());
app.use("/uploads", express.static("uploads"));

app.use("/api", authRoutes);

const sequelize = require("./config/db");
const User = require("./models/user");

sequelize.sync()
  .then(() => console.log("All tables created"))
  .catch(err => console.log(err));


const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server running on port ${PORT}`));
