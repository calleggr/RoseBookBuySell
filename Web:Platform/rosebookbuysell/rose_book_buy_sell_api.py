import endpoints
import main
from protorpc import messages
from protorpc import message_types
from protorpc import remote
from models import User, Listing, Offer, Book

@endpoints.api(name="rosebookbuysell",version="v1",description="Rose Book Buy Sell API")
class RoseBookBuySellApi(remote.Service):
    
    @User.method(path="user/insert", name="user.insert", http_method="POST")
    def user_insert(self, request):
        my_user = User(parent=main.USER_KEY, username = request.username, password = request.password, email = request.email)
        my_user.put()
        return my_user

app = endpoints.api_server([RoseBookBuySellApi], restricted = False)