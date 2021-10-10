const express = require('express')
const bodyParser = require('body-parser')
const cors = require('cors')

// Create express instance
const app = express()

// Require API routes
const users = require('./routes/users')
const test = require('./routes/test')
const auth = require('./routes/auth')

app.use(bodyParser.json())
app.use(cors())
// Import API Routes
app.use(users)
app.use(test)
app.use(auth)

// Export express app
module.exports = app

// Start standalone server if directly running
if (require.main === module) {
  const port = process.env.PORT || 3001
  app.listen(port, () => {
    // eslint-disable-next-line no-console
    console.log(`API server listening on port ${port}`)
  })
}
