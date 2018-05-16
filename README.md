# Social Login Light Module for Magnolia CMS 
Module that is integrated with Google to perform the login in the website.

<p align="center">
  <img src="https://user-images.githubusercontent.com/28932450/40145947-12e210e4-5964-11e8-8c48-63c905712a73.png">
</p>

## Features
This module can be used to set a variable that indicates in the back end whether we have a logged-in user or not. It is possible to use said variable to show or not magnolia components.

Dependencies:
This module has a dependency on the Magnolia CMS module 'JavaScript Models module'. -> magnolia-module-javascript-models-1.1.1.jar
Download: https://documentation.magnolia-cms.com/display/DOCS56/JavaScript+Models+module#JavaScriptModelsmodule-Installing

To integrate with Google you need to have a Google developer account.
Resgister: https://developers.google.com/
You can use your gmail email account
Use the google console to create credentials for the application a client ID

To know how to deploy this module see:
https://documentation.magnolia-cms.com/display/DOCS55/Light+modules


## Usage
Developing with Magnolia light development is a great advantage but there are situations in which a front developer may need to show certain information to the user depending on whether he is logged in or not.

With this module it is possible to do an authentication oauth using google sign-in and together with the power of JavaScript Models it is possible to save in session variables that can be used by the front developer in any module.

In this module I wanted to save the variable "googleLogged" as boolean in session.


I have decorated the travel-demo to add a version of the Magnolia login button. Through this button it is possible to log in with google and retrieve the following user data:
   * First name
   * Profile image
   * Email
   
<p align="center">
  <img src="https://user-images.githubusercontent.com/28932450/40145945-10be8ab8-5964-11e8-9da5-5b03421bc2cf.png">
</p>
  
On the other hand, the module has a dialog that is used to:
   * Configure the google id: YOUR_CLIENT_ID.apps.googleusercontent.com
   * Define an URL to make a request and sent the data of the logged-in user via ajax
  To prove this I have made an ajax request to https://haveibeenpwned.com/api/v2/breachedaccount/mail@mail.com?includeUnverified=true to know if the account has been hacked by another user, but this is just an example . It would be possible to send the data to any rest service and save the information in a database or in any other system
 
<p align="center">
  <img src="https://user-images.githubusercontent.com/28932450/40145939-0d2a7d80-5964-11e8-8c1c-1d873f40c10a.png">
</p>
 
Once the user logout the module deletes the session attribute and the components that are not wanted to be displayed to unlogged users will not be displayed.
<!--
Provide details about how a developer can make the component template,
or other features provided by the light module, available to content
authors.

This can include any special instructions about webresources or
availability. This could include instructions on 3rd party dependencies
such as jquery.

Describe how a template can be configured with parameters if
applicable.
-->


## Information on Magnolia CMS
This directory is a Magnolia 'light module'.
https://docs.magnolia-cms.com


## License
MIT

## Contributors
Franciso Gonzalez Perez, glez.perez.francisco@gmail.com
