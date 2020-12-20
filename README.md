This is a very simple RESTful API fetching restaurants. For now it doesn't call an external API.


To use the API:

curl -i -X PATCH                                        \
       -H 'Content-Type: application/json'              \
       -H 'X-User-Email: this@mail.org'               \
       -H 'X-User-Token: a6hYpzsfNJdYC6zEMxs3'          \
       -d '{ "restaurant": { "name": "New name" } }'    \
       https://nameless-escarpment-91784.herokuapp.com/api/v1/restaurants/1
