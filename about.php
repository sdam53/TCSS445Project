<!--
About page containing information on project and project members
-->

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Game Time</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, inital-scale=1.0">
    <!--stylesheet-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
        crossorigin="anonymous">
    <style>
      .home {
        height:50px;
      }
    </style>
</head>

<body>
  <!--Nagivation bar-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
      <div class="container-fluid">
        <a class="navbar-brand" href=""></a>
        <img id="home" class="home" src="logo.PNG" width="auto" alt=""></a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav me-auto mb-2 mb-lg-0">
            <li class="nav-item">
              <a class="nav-link" href="index.php">Home</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="games.php">Games</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="users.php">Users</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="developers.php">Developers</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="publishers.php">Publishers</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="reviews.php">Reviews</a>
            </li>
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="about.php">About</a>
            </li>
          </ul>
          <form class="d-flex" form method="get" action="search.php">>
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <button class="btn btn-outline-success" type="submit" >Search</button>
          </form>
        </div>
      </div>
  </nav>

  <!--information-->
  <div class="container">
    <h1 class="text-center"> Welcome!!!<br> 
      This is TCSS 445 Group 6 Project<br> 
      Here you can look up and add reviews to your favorite games<br>
      Group Members: <br>
      Shilnara Dam <br>
      Aaron L Purslow <br>
      Naomi Fletcher Nottingham 
    </h1>
  </div>
</body>
</html>