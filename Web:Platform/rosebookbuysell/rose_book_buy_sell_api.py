import endpoints
import protorpc
from models import User, Listing, Offer, Book

@endpoints.api(name="rosebookbuysell",version="v1",description="Rose Book Buy Sell API")
class RoseBookBuySellApi(protorpc.remote.Service):
    pass

app = endpoints.api_server([RoseBookBuySellApi], restricted = False)