# Project - Private Events

This project is part of the **Odin Project** curriculum.  
[Link to the full description](https://www.theodinproject.com/lessons/ruby-on-rails-private-events)

<br>

## Takeaway :

This project's goal was to to practice Active Record Associations.

Foreign keys were not named after the model class name, therefore we couldn't rely
on Active Record infering the table names and foreign keys on its own, we had to specifiy each of them throughout our models :

* User
* Event
* EventAttendance

<br>

### Functionality:

1. **A user can create many events, an event has one creator**

```ruby
# app/models/user.rb
has_many :created_events, foreign_key: 'creator', class_name: 'Event', dependent: :destroy

# app/models/events.rb
 belongs_to :creator, class_name: 'User'
```

If we call `@user.created_events` Active Record will lookup the events table, specified by `class_name: 'Event'`, for all the entries containing the user's id corresponding to the `creator_id` column.

Since it is a bidirectional relationship, when we ask for the event's creator :
`@event.creator`, Active Record will lookup the creator using the users table because we specified `class_name: User`

<br>
<br>

2. **A user can attend many events, an event many attendees**

For this many-to-many relationship, the through table event_attendances was created holding the user's id and the event's id as foreign keys but (again) named differently:
`attendee_id` and `attended_event_id`  

A **User** can retrieve all the events he attends through the event_attendances table with: `@user.attended_events`. This is possible by declaring the following:

<br>

```ruby
# app/models/user.rb
 has_many :event_attendances, foreign_key: :attendee_id
 has_many :attended_events, through: :event_attendances
```
<br>

When we query for the attended_events, Active Record queries the event_attandances table for an attended_event matching the **attendee_id**. Since we also specified on the **EventAttendance** model that an *attended_event* points to an **Event** object, and an attendee is a **User**, we are able to retrieve the events(objects).

<br>

```ruby
# app/models/event_attendance.rb
  belongs_to :attendee, class_name: 'User'
  belongs_to :attended_event, class_name: 'Event'
```

<br>


Finally, an Event has the ability to retrieve it's attendees in a similar way using:
`@event.attendees`
```ruby
# app/models/event.rb
  has_many :event_attendances, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendances
```


<br>

## Other notes :

### Two of our use cases involve retrieving records from an association :

* The Event's show page should list the attendees.
* The User's show page should list their attended events.

It was necessary to eager load the associated objects to avoid N+1 Queries using `#includes` method.