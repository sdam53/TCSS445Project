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
            line-height:1.4em
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
          <form class="d-flex" form method="get" action="search.php">>
            <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search" name="search">
            <button class="btn btn-outline-success" type="submit" >Search</button>
          </form>
        </div>
      </div>
    </nav>

    <!--series description-->
    <div class="container">
        <?php
            if (isset($_GET['series'])) {
                $series = $_GET['series'];
            }
        ?>
        <?php   
            $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
            if (mysqli_connect_errno()) { 
                die(mysqli_connect_error());   
            } 
            $sql = "SELECT Name, Description
                    FROM series
                    WHERE Name = '$series'"; 
            if ($result = mysqli_query($connection, $sql)) { 
                $row = mysqli_fetch_assoc($result);
            }
        ?>
        <div class="text">   
            <p><?php echo $row['Name'] ?></p>
            <p><?php echo $row['Description'] ?></p>

        </div>
        <?php mysqli_free_result($result); 
        mysqli_close($connection);?> 
    </div>

    <!--table listing all video games series-->
    <div class="container">
        <table class="table table-bordered" >
            <thead>
                <tr class="table-dark">
                    <th scope="col">Image</th>
                    <th scope="col">Title</th>
                    <th scope="col">Developer</th>
                    <th scope="col">Publisher</th>
                    <th scope="col">Release Date</th>
                </tr>
                <?php 
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
                if (mysqli_connect_errno()) { 
                    echo failure;
                    die(mysqli_connect_error());   
                } 
                $sql = "SELECT game.Image, game.Title, game.Developer, game.Publisher, game.Release_Date, game.Id
                        FROM game_series JOIN game ON game_series.Game_Id = game.Id
                        WHERE game_series.Series = '$series'"; 
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><img src=<?php echo $row['Image'] ?> width="100"  height=auto></th>
                            <td><?php echo "<a href='game_details.php?Id={$row['Id']}'>{$row['Title']}</a><br>\n" ?></td>
                            <td><?php echo "<a href='developer_details.php?developer={$row['Developer']}'>{$row['Developer']}</a><br>\n" ?></td>
                            <td><?php echo "<a href='publisher_details.php?publisher={$row['Publisher']}'>{$row['Publisher']}</a><br>\n" ?></td>
                            <td><?php echo $row['Release_Date'] ?></td>
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
     <!-- maybe dont need it --> 
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" 
            crossorigin="anonymous">
    </script>
</body>
</html>
  
