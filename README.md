# MOVIES AND SHOWS

This Rails App exposes a RESTful API to list movies and tv shows, allowing a user to purchase content and list purchases.

The API has the following endpoints:

* GET  /api/v1/movies(.:format) - Lists al the movies

* GET  /api/v1/seasons(.:format) - Lists al the seasons

* GET  /api/v1/titles(.:format) - Lists al the movies and seasons

* POST /api/v1/purchases(.:format) - Creates a new purchase, expecting the params: { user_id, purchase: { purchase_option_id } }

* GET  /api/v1/library(.:format) - Returns the user’s library, expecting the params: { user_id }

Integration tests were created using RSPEC
