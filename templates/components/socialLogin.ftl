[#if !model.loged()]<div [#if !cmsfn.isEditMode()] id="user-links"[/#if]>[/#if]
[#if content.idAppGoogle?has_content]
  <script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer></script>
  <meta name="google-signin-client_id" content="${content.idAppGoogle!}">

  <style>
    #loged{
      float: left;
      margin-left:  5px;
    }
    #user-links a {
      float: left;
    }
  </style>

  <script type="text/javascript">
    function onSignIn(googleUser) {
      var profile = googleUser.getBasicProfile();
      console.log('ID: ' + profile.getId()); // Do not send to your backend! Use an ID token instead.
      console.log('Name: ' + profile.getName());
      console.log('Image URL: ' + profile.getImageUrl());
      console.log('Email: ' + profile.getEmail()); // This is null if the 'email' scope is not present.

      var id_token = googleUser.getAuthResponse().id_token;
      var url = '${cmsfn.link(content)!""}' + '?id_token=' + id_token;
      console.log(url);
      $.get(  url, function( data ) {
          $("#user-links").html(data);
          $("#loged").text(profile.getName());
      });

      //restDestination
      var restDestination = "${content.restDestination!}".replace("{{email}}", profile.getEmail());
      restDestinationFunction(restDestination);

    }

    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
        auth2.signOut().then(function () {
        console.log('User signed out.');
        deleteCookie("was_checked");
        location.reload(true);
      });
    }

    function renderButton() {
    gapi.signin2.render('mgnl-signin2', {
      'scope': 'profile',
      'width': 140,
      'height': 20,
      'longtitle': true,
      'onsuccess': onSignIn
    });}

    function restDestinationFunction(urlRestDestination){
      if(urlRestDestination!=="" && document.cookie.indexOf("was_checked")<0){
        //https://haveibeenpwned.com/api/v2/breachedaccount/{{email}}?includeUnverified=true
        $.get(urlRestDestination, function (data) {
            bootbox.alert("Caution, your email could be attacked", function() {
              console.log("Alert Callback");
              addCookie("was_checked");
            });
        }).fail(function () {
            bootbox.alert("All right boy!", function() {
              console.log("Alert Callback");
              addCookie("was_checked");
            });
        });
      }
    }

    function deleteCookie (name) {
      document.cookie = name + '=;path=/;expires=Thu, 01 Jan 1970 00:00:01 GMT;';
    };

    function addCookie (name) {
      document.cookie = name + '=setted;path=/;expires=Thu, 01 Jan 2070 00:00:01 GMT;';
    };

  </script>

  <script src="https://cdnjs.cloudflare.com/ajax/libs/bootbox.js/4.4.0/bootbox.min.js"></script>

  [#if !model.loged()]
    <div id="mgnl-signin2" class="g-signin2" data-onsuccess="onSignIn" ></div>
  [/#if]

  [#if model.loged()]
    <a href="#" onclick="signOut();">Sign out</a>
    <div id="loged">Bienvenido</div>
  [/#if]
[/#if]
[#if !model.loged()]</div>[/#if]
