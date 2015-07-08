from endpoints_proto_datastore.ndb.model import EndpointsModel
from google.appengine.ext import ndb

class User(EndpointsModel):
    """User model"""
    _message_fields_schema = ("entityKey", "username", "password", "email")
    username = ndb.StringProperty()
    password = ndb.StringProperty()
    email = ndb.StringProperty()

class Listing(EndpointsModel):
    """listing model"""
    _message_fields_schema = ("entityKey", "user_id", "last_touch_date_time")
    price = ndb.StringProperty()
    user_id = ndb.KeyProperty(kind=User)
    last_touch_date_time = ndb.DateTimeProperty(auto_now=True)


class Offer(EndpointsModel):
    """offer model"""
    _message_fields_schema = ("entityKey", "amount", "user_id", "listing_id", "last_touch_date_time")
    amount = ndb.StringProperty()
    user_id = ndb.KeyProperty(kind=User)
    listing_id = ndb.KeyProperty(kind=Listing)
    last_touch_date_time = ndb.DateTimeProperty(auto_now=True)


class Book(EndpointsModel):
    """book model"""
    _message_fields_schema = ("entityKey", "name", "course", "listing_id")
    name = ndb.StringProperty()
    course_number = ndb.IntegerProperty()
    department = ndb.StringProperty()
    listing_id = ndb.KeyProperty(kind=Listing)


