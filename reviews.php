<?php require_once('config.php'); ?>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Game Time</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, inital-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" 
        rel="stylesheet" 
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" 
        crossorigin="anonymous">



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
                <a class="nav-link active" aria-current="page" href="reviews.php">Reviews</a>
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



    <!--list of reviews in asc order by date-->
    <div class="container">
        <table class="table table-bordered" >
            <thead>
                <tr class="table-dark">
                    <th scope="col"></th>
                    <th scope="col">Title</th>
                    <th scope="col">User</th>
                    <th scope="col">Head</th>
                    <th scope="col">Body</th>
                    <th scope="col">Rating</th>
                    <th scope="col">Date</th>
                </tr>
                <?php 
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
                if (mysqli_connect_errno()) { 
                    echo failure;
                    die(mysqli_connect_error());   
                } 
                $sql = "SELECT game.Title, user.Name_Display, review.Head, review.Body, review.Date, user.Id as 'userId', game.Id as 'gameId', review.Rating, game.Image
                        FROM review JOIN game ON review.Game_Id = game.Id
                        JOIN user ON review.User_Id = user.Id
                        ORDER BY date DESC";
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><img src=<?php echo $row['Image'] ?> width="100"  height=auto></th>
                            <td><?php echo "<a href='game_details.php?Id={$row['gameId']}'>{$row['Title']}</a><br>\n" ?></td>
                            <td><?php echo "<a href='user_details.php?Id={$row['userId']}'>{$row['Name_Display']}</a><br>\n" ?></td>
                            <td><?php echo $row['Head'] ?></td>
                            <td><?php echo $row['Body'] ?></td>
                            <td><?php echo $row['Rating'] ?></td>
                            <td><?php echo $row['Date'] ?></td>
                        </tr>
                <?php 
                    } 
                    // release the memory used by the result set 
                    mysqli_free_result($result);  
                }  
                // close the database connection 
                mysqli_close($connection); 
                ?> 
            </thead>
        </table>
    </div>
  
</body>


</html>