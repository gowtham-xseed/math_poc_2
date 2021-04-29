const express = require("express");
const app = express();
const cors = require('cors')
app.use(cors())
const PORT = process.env.PORT || 8080;

app.use(express.static('./build/web/'))

app.get('/health_check', (req, res) => {
    res.send('App is running');
})

app.listen(PORT, () => {
  console.log("Server started in " + PORT);
});
