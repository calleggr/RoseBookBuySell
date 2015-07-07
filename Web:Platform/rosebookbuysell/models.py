from endpoints_proto_datastore.ndb.model import EndpointsModel
from google.appengine.ext import ndb

class User(EndpointsModel):
    """User model"""
    #should have many listings and users
    _message_fields_schema = ("entityKey", "username", "password", "email")
    username = ndb.StringProperty()
    password = ndb.StringProperty()
    email = ndb.StringProperty()

class Listing(EndpointsModel):
    #should belong to user and have a book
    pass

class Offer(EndpointsModel):
    #should belong to a listing and a user
    pass

class Book(EndpointsModel):
    #should belong to a listing
    pass

