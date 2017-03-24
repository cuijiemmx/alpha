Template.navbar.events
  'change #sliding-menu-controller': (e) ->
    $('body')[ if e.currentTarget.checked then 'addClass' else 'removeClass' ] 'no-overflow'

  'click .sliding-menu a': () ->
    $('#sliding-menu-controller').prop 'checked', false

Template.navbar.helpers
  formatDate: ->
    d = new Date()
    dayList = ['天', '一', '二', '三', '四', '五', '六']
    d.getFullYear() + '年' + d.getMonth() + '月' + d.getDate() + '日 星期' + dayList[d.getDay()]