import pymongo
import itertools

c = pymongo.Connection()
houses = c.properties.properties.find({'living_area':{'$exists':1},'list_price':{'$exists':1}},fields=['living_area','list_price'])

def _get_data(count):
    global houses
    house_slice = itertools.islice(houses,0,count)
    out = [(int(h['living_area']),int(h['list_price'])/1000) for h in house_slice if h.get('list_price') and h.get('living_area')]
    return zip(*out)


def get(total):
    return _get_data(total/7),_get_data(total/2),_get_data(total/1)
