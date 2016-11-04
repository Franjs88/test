express = require('express')
path = require 'path'
bodyParser = require('body-parser')
cors = require('cors')
app = express()

# API ROUTES BELOW
# Generic error handler used by all endpoints.

handleError = (res, message, code) ->
  console.log 'ERROR: ' + reason
  res.status(code or 500).json 'error': message
  return

app.use express.static path.join(__dirname, 'frontend')
app.use bodyParser.json()
corsOptions = undefined
corsOptions =
  origin: true
  credentials: true
app.use cors(corsOptions)

###
# For the purpose of this simple blog, we won't use a database to store the posts
###

posts = [
  {
    title: '¿Cuáles son los errores que más se repiten en un proyecto software?'
    categorie: 'Software Management'
    previewText: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam ipsum lectus, varius sit amet ipsum id, rutrum accumsan ipsum. Curabitur lobortis, arcu a molestie consequat, massa orci interdum lacus, eget molestie elit dolor quis risus. Aliquam est turpis, consectetur et mattis ut, ultrices nec enim. Etiam nisl erat, tincidunt quis egestas et, consequat at orci. Praesent euismod metus quis eros cursus, vel faucibus justo pulvinar. Sed pulvinar sed urna sit amet tincidunt. Sed ut auctor nibh. Vestibulum laoreet orci sit amet risus suscipit fringilla. Suspendisse malesuada ipsum ut egestas facilisis. In eget ex nec mauris facilisis scelerisque eu et enim. Nunc aliquet libero id enim imperdiet bibendum. Quisque laoreet massa tortor, vitae lobortis urna vehicula sed. Quisque sit amet efficitur leo. Aenean efficitur tincidunt felis ut ornare. Curabitur hendrerit eu metus commodo suscipit. Nam cursus nulla ac malesuada cursus. Curabitur egestas euismod massa nec malesuada. Integer velit sem, molestie ut mi sit amet, condimentum congue leo. Suspendisse id faucibus odio. Donec non imperdiet neque. Maecenas at sem mi. Fusce in libero volutpat, suscipit velit at, dignissim elit. Nulla vel turpis in nunc hendrerit dictum id lobortis velit. Maecenas sapien magna, imperdiet at diam at, vestibulum ultricies velit. Aliquam consectetur risus non laoreet tempor. Nullam molestie arcu at tortor maximus blandit. Suspendisse scelerisque dui ut gravida rutrum. Phasellus a augue urna.'
  }
  {
    title: 'El Sprint cero y el Sprint de release'
    categorie: 'Software Engineering'
    previewText: 'Etiam elementum ullamcorper lorem eget sagittis. Aenean varius diam risus, et sodales purus molestie eu. Fusce condimentum scelerisque aliquet. Duis non dolor eget nulla aliquet cursus. Morbi molestie dui nunc, at fermentum nibh hendrerit nec. Ut massa tortor, gravida eu elit gravida, cursus luctus odio. Mauris condimentum porttitor risus, non sodales turpis euismod vel. Nullam sed sem sit amet orci egestas mattis eget sit amet purus. Curabitur lobortis laoreet lacus, id convallis orci efficitur non. Nam a leo eu odio finibus lobortis. Curabitur congue, sem eu commodo eleifend, ipsum arcu condimentum magna, eu feugiat leo massa hendrerit leo. Morbi nec magna ac ipsum dictum ullamcorper. Quisque vel egestas magna. Nam cursus nulla ac malesuada cursus. Curabitur egestas euismod massa nec malesuada. Integer velit sem, molestie ut mi sit amet, condimentum congue leo. Suspendisse id faucibus odio. Donec non imperdiet neque. Maecenas at sem mi. Fusce in libero volutpat, suscipit velit at, dignissim elit. Nulla vel turpis in nunc hendrerit dictum id lobortis velit. Maecenas sapien magna, imperdiet at diam at, vestibulum ultricies velit. Aliquam consectetur risus non laoreet tempor. Nullam molestie arcu at tortor maximus blandit. Suspendisse scelerisque dui ut gravida rutrum. Phasellus a augue urna.'
  }
  {
    title: '¿Bases de datos NoSQL o Bases de datos SQL? ¿Tiene sentido en “nuestro mundo” usar bases de datos NoSQL?'
    categorie: 'Databases'
    previewText: 'Aenean ullamcorper sapien in luctus vehicula. Donec consectetur dolor aliquam felis ornare condimentum. Phasellus varius consectetur mauris, vel bibendum erat convallis vitae. Nulla nec nisl a orci ullamcorper pulvinar a at turpis. Praesent sagittis elit sem, vitae vulputate massa laoreet sed. Nulla eget maximus quam, id pharetra purus. Pellentesque dui lorem, pulvinar eu mi vel, fermentum rutrum magna. Etiam justo nulla, imperdiet at feugiat rhoncus, rutrum eget ex. Aliquam pharetra nec nisi id euismod. Pellentesque ligula erat, facilisis eget lectus vitae, ornare tempor felis. Cursus nulla ac malesuada cursus. Curabitur egestas euismod massa nec malesuada. Integer velit sem, molestie ut mi sit amet, condimentum congue leo. Suspendisse id faucibus odio. Donec non imperdiet neque. Maecenas at sem mi. Fusce in libero volutpat, suscipit velit at, dignissim elit. Nulla vel turpis in nunc hendrerit dictum id lobortis velit. Maecenas sapien magna, imperdiet at diam at, vestibulum ultricies velit. Aliquam consectetur risus non laoreet tempor. Nullam molestie arcu at tortor maximus blandit. Suspendisse scelerisque dui ut gravida rutrum. Phasellus a augue urna.'
  }
]
# Initialize the app.
server = app.listen(process.env.PORT or 8080, ->
  port = server.address().port
  console.log 'Magic happens on port', port
  return
)
app.get '/', (req, res) ->
  res.status(200).send 'Welcome to our REST API for the simple blog!'
  return

###  "/posts"
#    GET: returns all posts
###

app.get '/posts', (req, res) ->
  if posts == null or posts == undefined
    handleError res, 'Undefined posts.'
  else
    res.status(200).send posts
  return