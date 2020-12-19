This is a very simple RESTful API fetching restaurants in a radius of an address corresponding to the favorite cuisine styles of the attendees. I did it on a saturday afternoon so please don't mind it if there is some unoptimal code. Feel free to propose modifications.


To use Authentication_token:

# rails c
user = User.find_by(email: "bruce@wayne.com")
user.save  # The user did not have any token yet. This call generated one.
user.reload.authentication_token
# => "a6hYpzsfNJdYC6zEMxs3"

curl -i -X PATCH                                        \
       -H 'Content-Type: application/json'              \
       -H 'X-User-Email: seb@lewagon.org'               \
       -H 'X-User-Token: a6hYpzsfNJdYC6zEMxs3'          \
       -d '{ "restaurant": { "name": "New name" } }'    \
       http://localhost:3000/api/v1/restaurants/1
