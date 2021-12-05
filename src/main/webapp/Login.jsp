<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>HRS Login</title>
  <link rel="stylesheet" href="css/styles.css">
</head>
<body>
  
      <div class="maindiv">
      <form action="Login" method ="post">
        <img src="hr logo.jpg" alt="HRS">
        <h3>Sign in To</h3>
        <h1>HR SYSTEM</h1>
        <div class="inputs">
          <div class="Fields">
            <div class="Fieldset">
              <input type="text" class="Before-FS" name="uname" required autocomplete="off">
              <h1 class="Fs-H"><span>User Name</span></h1>
              <label class="placeholder">Username</label>
            </div>
          </div>
          <div class="Fields">
            <div class="Fieldset">
              <input type="password" name="passwd" class="Before-FS" required>
              <h1 class="Fs-H"><span>Password</span></h1>
              <label class="placeholder">Password</label>
            </div>
          </div>

        </div>
          <button type="submit" value="Login">Login</button>
          <p>Forgot password?</p>
          </form>
      </div>

</body>
</html>