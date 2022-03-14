<!--
home page that contains random three games in a slide show
-->


<?php require_once('config.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
  <style>
    .carousel-indicators, img {
      /*--use height to adjust fit*/
      height:500px;
      object-fit: contain;
    }
  </style>
  <title>Game Time</title>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, inital-scale=1.0">
  <!--stylesheets-->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body>
  <!--Nagivation bar-->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
      <a class="navbar-brand" href="#">GameTime</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav me-auto mb-2 mb-lg-0">
          <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="index.php">Home</a>
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
            <a class="nav-link" href="about.php">About</a>
          </li>
        </ul>
        <form class="d-flex" form method="get" action="search.php">>
          <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
          <button class="btn btn-outline-success" type="submit" >Search</button>
        </form>
      </div>
    </div>
  </nav>

  <!--carousel of random 3 games--> 
  <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel" data-interval="5000" data-pause="false" style="background-color:Black; object-fit:cover;">
    <ol class="carousel-indicators">
      <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
      <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
    </ol>
    <?php 
    $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
    if (mysqli_connect_errno()) { 
        echo failure;
        die(mysqli_connect_error());   
    } 
    $sql = "SELECT game.Title, game.Id, game.Image
            FROM (select review.Game_Id as 'gameid', AVG(review.Rating) as 'Average'
                    FROM review
                    GROUP BY review.Game_Id
                ) as T
            JOIN game
            ON game.Id = gameid
            ORDER BY RAND()
            LIMIT 3"; 
    if ($result = mysqli_query($connection, $sql)) { 
        $row = mysqli_fetch_assoc($result)
    ?>
    <div class="carousel-inner">
      <div class="carousel-item active">
        <img class="d-block w-100" src=<?php echo $row['Image'] ?> alt="First slide">
      </div>
      <?php $row = mysqli_fetch_assoc($result) ?>
      <div class="carousel-item">
        <img class="d-block w-100" src=<?php echo $row['Image'] ?> alt="Second slide">
      </div>
      <?php $row = mysqli_fetch_assoc($result) ?>
      <div class="carousel-item">
        <img class="d-block w-100" src=<?php echo $row['Image'] ?> alt="Third slide">
      </div>
    <?php 
    }
    mysqli_free_result($result); 
    mysqli_close($connection); 
    ?> 
    <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
      <span class="carousel-control-prev-icon" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
      <span class="carousel-control-next-icon" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>  
  </div>

  <!--scripts-->
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script></script>
</body>

</html>