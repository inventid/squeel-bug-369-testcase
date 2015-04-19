o = Organization.create name: 'organization'
e = Event.create name: 'event', organization: o
s = Shop.create name: 'shop', event: e

u = User.create name: 'test user', email_address: 'devnull@inventid.us'
