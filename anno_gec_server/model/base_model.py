__author__ = 'topcircler'

from google.appengine.ext import ndb

from model.user import User


class BaseModel(ndb.Model):
    """
    Base model for all anno models.
    """
    create_time = ndb.DateTimeProperty(auto_now=True)
    creator = ndb.KeyProperty(kind=User)