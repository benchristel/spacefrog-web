"use strict"

var personalInfoFields = [
  'name-prefix',
  'first-name',
  'last-name',
  'address-1',
  'address-2',
  'city',
  'zip-code',
  'email',
  'home-phone',
  'work-phone',
  'cell-phone',
  'caller-code',
  'aircraft-type',
  'disturbance-type',
  'activity-disturbed',
  'response-method'
]

function refillPersonalInfo() {
  personalInfoFields.forEach(function(fieldId) {
    $('#'+fieldId).val(localStorage[fieldId] || '')
  })
}

function savePersonalInfo() {
  personalInfoFields.forEach(function(fieldId) {
    localStorage[fieldId] = $('#'+fieldId).val() || ''
  })
}

var formatters = {
  "phone": function(value) {
    var digits = value.replace(/\D/g, '')
    return "("+digits.slice(0,3)+") "+digits.slice(3,6)+"-"+digits.slice(6,10)
  },
  "time": function(value) {
    var components = value.split(/\D+/)
    var mo = zeropad(components[1])
    var yyyy = components[0]
    var dd = components[2]
    var hh = zeropad((0 + components[3]) % 12)
    if (hh == '00') hh = '12'
    var mm = zeropad(components[4])
    var am = (0 + components[3]) < 12 ? 'am' : 'pm'

    //var mo = zeropad(date.getUTCMonth() + 1)
    //var yyyy = date.getUTCFullYear()
    //var dd = zeropad(date.getUTCDate())
    //var hh = zeropad(date.getUTCHours() % 12)
    //if (hh == '00') hh = '12'
    //var mm = zeropad(date.getUTCMinutes())
    //var am = date.getUTCHours() < 12 ? 'am' : 'pm'
    return mo + "/" + dd + "/" + yyyy + " " + hh + ":" + mm + " " + am
  }
}

var danticores = {
  "first-time": function() {
    return $('#caller-code').val() === '' ? 'YES' : 'NO'
  },
  "email-copied": function() {
    return 'YES'
  }
}

var htmlTemplate = "<html><table> <tr><td width='200px' align='right'>First Time to report noise :</td><td>{{first-time}}</td></tr> <tr><td colspan=2><b>Personal Information:</b></td></tr> <tr><td width='200px' align='right'>Name Prefix :</td><td>{{name-prefix}}</td></tr> <tr><td width='200px' align='right'>First Name :</td><td>{{first-name}}</td></tr> <tr><td width='200px' align='right'>Last Name :</td><td>{{last-name}}</td></tr> <tr><td width='200px' align='right'>Name Suffix :</td><td></td></tr> <tr><td width='200px' align='right'>Caller Code :</td><td>{{caller-code}}</td></tr> <tr><td width='200px' align='right'>Address 1 :</td><td>{{address-1}}</td></tr> <tr><td width='200px' align='right'>Address 2 :</td><td>{{address-2}}</td></tr> <tr><td width='200px' align='right'>City :</td><td>{{city}}</td></tr> <tr><td width='200px' align='right'>Zip Code :</td><td>{{zip-code}}</td></tr> <tr><td width='200px' align='right'>Cross Street :</td><td></td></tr> <tr><td width='200px' align='right'>Home Phone :</td><td>{{home-phone}}</td></tr> <tr><td width='200px' align='right'>Work Number :</td><td>{{work-phone}}</td></tr> <tr><td width='200px' align='right'>Cell Number :</td><td>{{cell-phone}}</td></tr> <tr><td width='200px' align='right'>Email :</td><td>{{email}}</td></tr> <tr><td colspan=2><b>Noise Event Information:</b></td></tr> <tr><td width='200px' align='right'>Disturbance Start Date and Time :</td><td>{{time}}</td></tr> <tr><td width='200px' align='right'>Disturbance End Date and Time :</td><td>{{time}}</td></tr> <tr><td width='200px' align='right'>Aircraft Type :</td><td>{{aircraft-type}}</td></tr> <tr><td width='200px' align='right'>Disturbance Type :</td><td>{{disturbance-type}}</td></tr> <tr><td width='200px' align='right'>Activity Disturbed :</td><td>{{activity-disturbed}}</td></tr> <tr><td width='200px' align='right'>Airline :</td><td></td></tr> <tr><td width='200px' align='right'>Operation :</td><td></td></tr> <tr><td width='200px' align='right'>Comments :</td><td>{{comments}}</td></tr> <tr><td width='200px' align='right'>Response Method :</td><td>{{response-method}}</td></tr> <tr><td width='200px' align='right'>Complainant copied on email :</td><td>{{email-copied}}</td></tr></table></html>"

function message() {
  return htmlTemplate.replace(/{{[^}]+}}/g, function(found) {
    var id = found.slice(2, found.length - 2)
    var $element = $('#'+id)
    if ($element.length) {
      var value = $element.val()
      var formatterName = $element.attr('data-formatter')
        if (formatters[formatterName]) {
        return formatters[formatterName](value)
      } else {
        return value
      }
    } else {
      console.log(id)
      return danticores[id]()
    }
  })
}

var sfoEmail = "sfo.noise@flysfo.com"
function sendMail(address, message) {
  console.log(address)
  console.log(message)
  $.post('/',
    {  postmarkKey: "a33f40d0-f9d9-474c-8d5e-537d047b1d16",
       emailTo:     address,
       emailFrom:   sfoEmail,
       subject:     "Online Noise Complaint Form",
       message:     message
    },
    function() {
      $('#success').show();
      $('#preview').hide();
      setInterval(function() { $('#success').hide() }, 2000)
    }
   )
}

function zeropad(s) {
  var out = ""+s
  while(out.length < 2) out = "0" + out
  return out;
}

function currentFormattedTime() {
  var now = new Date()
  return [
    now.getFullYear(), '-', zeropad(now.getMonth()+1), '-', zeropad(now.getDate()), 'T',
    zeropad(now.getHours()), ':', zeropad(now.getMinutes())
  ].join('')
}

function fillCurrentTime() {
  $('#time').val(currentFormattedTime())
}

function submitterEmail() {
  return $('#email').val()
}

$(document).ready(function() {
  refillPersonalInfo()
  fillCurrentTime()

  $('#preview-button').click(function() {
    savePersonalInfo()
    $('#preview-content').html(message())
    $('#preview').show()
    $('#form-wrapper').hide()
  })

  $('#submit').click(function() {
    sendMail(sfoEmail, message())
    sendMail(submitterEmail(), message())
    $('#preview').hide()
    $('#form-wrapper').show()
  })

  $('.close-button > span').click(function() {
    $("#"+$(this).attr('data-close')).hide()
    $('#form-wrapper').show()
  })
})
