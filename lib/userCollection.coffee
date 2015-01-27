Meteor.methods
  updateUser: (data) ->
    console.log data
    _id = data._id
    delete data._id

#    The password for a user is stored as a hash that we can't see
#    Save off the value then remove it from the data to be stored.
    password = data.password
    delete data.password

#    Fix up the incoming data. Some of the form inputs need to be moved around
#    so that they map into the correct area of the user object.

    profileItems = [
      'lastName'
      'firstName'
      'sex'
      'birthday'
      'receiveInvites'
      'receiveNewsletter'
    ]

    data.profile = {}
    for item in profileItems
      data.profile[item] = data[item]
      delete data[item]

    if password isnt ""
      if Meteor.isServer
        Accounts.setPassword _id, password

    Meteor.users.update({_id: _id}, {$set: data})