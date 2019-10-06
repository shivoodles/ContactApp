<html>
<head>
<title>Import GMAIL Contact</title>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.8.2/jquery.min.js">
  </script>
  <script src="https://apis.google.com/js/client:platform.js?onload=start" async defer>
  </script>
</head>
<body>
<a  href="https://accounts.google.com/o/oauth2/auth?
client_id=1030738338208-btfrme7du2i58vujpv8hqa08atgg5fdp.apps.googleusercontent.com
&amp;redirect_uri=http://localhost:4444/ContactApp/authenticate&amp;
scope=http://www.google.com/m8/feeds/&amp;response_type=code">Import contacts	</a>

<%--<button id="signinButton">Sign in with Google</button>
<script>
  $('#signinButton').click(function() {
    // signInCallback defined in step 6.
    auth2.grantOfflineAccess().then(signInCallback);
  });
</script>
<script>
function signInCallback(authResult) {
  if (authResult['code']) {

    // Hide the sign-in button now that the user is authorized, for example:
    $('#signinButton').attr('style', 'display: none');

    // Send the code to the server
    $.ajax({
      type: 'POST',
      url: 'http://example.com/storeauthcode',
      // Always include an `X-Requested-With` header in every AJAX request,
      // to protect against CSRF attacks.
      headers: {
        'X-Requested-With': 'XMLHttpRequest'
      },
      contentType: 'application/octet-stream; charset=utf-8',
      success: function(result) {
        // Handle or verify the server response.
      },
      processData: false,
      data: authResult['code']
    });
  } else {
    // There was an error.
  }
}
</script>

--%></body>


</html>