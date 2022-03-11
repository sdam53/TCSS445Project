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
    <style> 
        .container {
            position: relative;
            text-align: justify;
            width: 900px;
        }
        .text{
            top: [height of img];
            background: black;
            color: white;
            margin: auto;
            text-align: center;
            line-height: 10px;
            padding-bottom: 5px;
            padding-top: 5px;
        }
        img {
            /*--use height to adjust fit*/
            display: block;
            height: auto;
        }
 
}
    </style>


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
              <a class="nav-link active" aria-current="page" href="games.php">Games</a>
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
          <form class="d-flex">
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
            <button class="btn btn-outline-success" type="submit">Search</button>
          </form>
        </div>
      </div>
    </nav>

    <!--game image and information-->
    <div class="container">
        <?php
            if (isset($_GET['Id'])) {
                $Id = $_GET['Id'];
            }
        ?>
        <?php   
            $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
            if (mysqli_connect_errno()) { 
                die(mysqli_connect_error());   
            } 
            $sql = "SELECT Id, Title, Series, Developer, Publisher, Release_Date, Image FROM game WHERE Id = $Id"; 
            if ($result = mysqli_query($connection, $sql)) { 
                $row = mysqli_fetch_assoc($result);
            }
        ?>
        <img class="d-block w-100" src=<?php echo $row['Image'] ?>>
        <div class="text">   
            <p><?php echo "Title:"?></p>
            <p><?php echo "<a href='game_details.php?Id={$row['Id']}'>{$row['Title']}</a><br>\n" ?></p>
            <p><?php echo "Series:"?></p>
            <p><?php echo "<a href='series_details.php?series={$row['Series']}'>{$row['Series']}</a><br>\n" ?></p>
            <p><?php echo "Developer:"?></p>
            <p><?php echo "<a href='developer_details.php?developer={$row['Developer']}'>{$row['Developer']}</a><br>\n" ?></p>
            <p><?php echo "Publisher:"?></p>
            <p><?php echo "<a href='publisher_details.php?publisher={$row['Publisher']}'>{$row['Publisher']}</a><br>\n" ?></p>
            <p><?php echo "Release Date:"?></p>
            <p><?php echo $row['Release_Date'] ?></p>
        </div>
        <?php mysqli_free_result($result); 
        mysqli_close($connection);?> 
    </div>

    <!--list of reviews-->
    <div class="container">
        <div class="row">
            <?php   
            $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
            if (mysqli_connect_errno()) { 
                die(mysqli_connect_error());   
            } 
            $sql = "SELECT user.Name_Display, review.Head, review.Body, review.Rating, review.Date, user.Id
                    FROM review JOIN user ON review.User_Id = user.Id
                    WHERE review.Game_Id = $Id"; 
            if ($result = mysqli_query($connection, $sql)) {
                    // loop through the data 
                while($row = mysqli_fetch_assoc($result)) {
            ?>
                    <div class="card">
                        <div class="card-body">
                            <h4 class="card-title"><?php echo $row['Date']?></h5>
                            <h4 class="card-title"><?php echo "<a href='user_details.php?Id={$row['Id']}'>{$row['Name_Display']}</a><br>\n" ?></h5>
                            <h5 class="card-title"><?php echo $row['Head'] . " " . $row['Rating'] . "/10"?></h5>
                            <p class="card-text">
                                <?php echo $row['Body'] ?>
                            </p>
                        </div>
                    </div>
            <?php
                }
                mysqli_free_result($result); 
            }
            mysqli_close($connection); 
            ?>
        </div>
    </div>
     <!-- maybe dont need it --> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
            crossorigin="anonymous">
    </script>
</body>
</html>
  
