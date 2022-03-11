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
                <a class="nav-link active" aria-current="page" href="publishers.php">Publishers</a>
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
    
    <?php
        if (isset($_GET['publisher'])) {
            $publisher = $_GET['publisher'];
        }
    ?>
    <!--publisher details-->
    <div class="container">
        <div class="row">
            <?php   
            $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
            if (mysqli_connect_errno()) { 
                die(mysqli_connect_error());
            } 
            $sql = "SELECT Name, Headquarters, About_URL
                    FROM publisher
                    WHERE Name = '$publisher'"; 
            if ($result = mysqli_query($connection, $sql)) {
                    // loop through the data 
                while($row = mysqli_fetch_assoc($result)) {
            ?>
                    <div class="card">
                        <div class="card-body">
                            <h2 class="card-title"><?php echo $row['Name']?></h2>
                            <h4 class="card-title"><?php echo $row['Headquarters']?></h4>
                            <h4 class="card-title"><?php echo "<a href='{$row['About_URL']}'>{$row['About_URL']}</a><br>\n" ?></h4>
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

    <!--table listing all games published by publisher-->
    <div class="container">
        <table class="table table-bordered" >
            <thead>
                <tr class="table-dark">
                    <th scope="col">Image</th>
                    <th scope="col">Title</th>
                    <th scope="col">Series</th>
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
                $sql = "SELECT Id, Title, Series, Developer, Publisher, Release_Date, Image 
                        FROM game
                        where Publisher = '$publisher'"; 
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><img src=<?php echo $row['Image'] ?> width="100"  height=auto></th>
                            <td><?php echo "<a href='game_details.php?Id={$row['Id']}'>{$row['Title']}</a><br>\n" ?></td>
                            <td><?php echo "<a href='series_details.php?series={$row['Series']}'>{$row['Series']}</a><br>\n" ?></td>
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