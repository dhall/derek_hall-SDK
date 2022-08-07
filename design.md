# LOTR SDK Design Approach

## Constraints
I needed to time-box this initial version to under 5 hours of effort. Design constraints are a good thing to practice, as in real world problems there are always constraints to consider (time, resources, other requirements, etc).

## Priorities
Since I knew I would be limited on time, I wanted to get the 'plumbing' in place and prioritize what I worked on. I think it's important to have a testing approach that doesn't rely on the availability of any third party APIs. A few reasons for that are
* Availability: the status of an API or connectivity to a network should not stop your tests from completing
* Good stewardship: my development tests will may run very frequently and it's not nice to flood an API with a lot of wasted requests from your test suite
* Resource management: this API is rate limited, so our tests could cause our real usage to get timed out, but especially in cases where you are paying for a specified amount of requests

After the general dev and build overhead was in place, I started building out the usage of SDK. I didn't want a user to need to know a lot about the API or about REST APIs in general. I designed a client that gets instantiated with the secret key. The requests take a natural language approach such as `movie_list` to get a list of movies.

I wanted the data returned to be more than raw json data, so it knows something about itself. I called this a `dataset` and the user can easily determine if they have data or an error by methods of those names. When data is present, the dataset also has `meta` information that can be used to gather additional pages of data. As long as `next_page_number` is a truthy value, there is more data available.

## Future Direction
Even with this simple API, building a robust SDK takes a lot of work. I've only started that process with this first version. Some clear next steps would be

* Sorting, ordering, filtering: the API has robust support for these operations so it would be a nice addition to allow doing this on the API side. This would keep from needing to pull all data into the client just to search for a particular entry, for example.
* Test coverage: The framework and approach is in place, so adding more comprehensive tests would be a good use of time.
* Full datasets: Adding a method that loops through the operations and gets all data would be useful. It's straightforward to do this on the client side but it would be a nice convenience.
