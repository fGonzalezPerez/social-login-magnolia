
var socialLogin = function () {

    this.loged = function(){
      var id_token = ctx.getParameter("id_token");
      var validateTokenEndpoint = "https://www.googleapis.com/oauth2/v3/tokeninfo?id_token=" + id_token;
      var url = new java.net.URL(validateTokenEndpoint);
		  var con = url.openConnection();

  		con.setRequestMethod("GET");
  		var status = con.getResponseCode();

      if(status == 200){
        ctx.getRequest().getSession().setAttribute("googleLoged", true);
        return true;
      } else {
        ctx.getRequest().getSession().setAttribute("googleLoged", false);
        return false;
      }

    }
};

new socialLogin();
