$.Editable.DEFAULTS.key = false

Template.mmInputToggle.helpers
  checked: ->
    if this.value is true
      return 'checked'
    else
      return''

Template.mmInputRichText.helpers
	value: ->
#		console.log(this)
		if this.value?

			return new Spacebars.SafeString(this.value)

Template.mmInputRichText.rendered = ->
  $('textarea.mmInputRichTextArea').editable
    theme: 'custom'
    inlineMode: false
    spellcheck: true
    minHeight: 300
    maxHeight: Math.max(document.documentElement.clientHeight, window.innerHeight or 0) - 80
    buttons: ['bold', 'italic', 'underline', 'fontSize', 'color', 'align', 'insertUnorderedList', 'insertOrderedList', 'removeFormat']



Template.mmNextPage.helpers
  classes: ->
    classes = ['item-icon-right']
    if this.class?
      customClasses = this.class.split(' ')
      for klass in customClasses
        classes.push(klass)
    return classes.join(' ')

Template.mmIonCard.helpers
  classes: ->
    classes = ['card']
    if this.class?
      customClasses = this.class.split(' ')
      for klass in customClasses
        classes.push(klass)
    return classes.join(' ')


@pausecomp = (millis) ->
  date = new Date
  curDate = null
  loop
    curDate = new Date
    unless curDate - date < millis
      break
  return

Template.scrollHelper.rendered = ->
  $('.overflow-scroll').scrollEnd (->
    Session.set 'touchDefaultState', true
    return
  ), 150
