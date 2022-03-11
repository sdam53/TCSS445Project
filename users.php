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
                <a class="nav-link active" aria-current="page" href="users.php">Users</a>
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
    
    <!--table listing all critics-->
    <div class="container">
        <table class="table table-bordered" >
            <thead>
                <tr class="table-dark">
                    <th scope="col"> Critic User Name</th>
                    <th scope="col">Verified</th>
                    <th scope="col">Rating</th>
                    <th scope="col">Publication</th>
                </tr>
                <?php 
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
                if (mysqli_connect_errno()) { 
                    echo failure;
                    die(mysqli_connect_error());   
                } 
                $sql = "SELECT user.Id, user.Name_Display, Is_Verified, User.Publication, User_Rating, game_critic_publication.About_URL
                FROM user JOIN game_critic_publication ON User.Publication = game_critic_publication.Publication"; 
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><?php echo "<a href='user_details.php?Id={$row['Id']}'>{$row['Name_Display']}</a><br>\n" ?></th>
                            <td><?php echo $row['Is_Verified']?></td>
                            <td><?php echo $row['User_Rating']?></td>
                            <td><?php echo "<a href='{$row['About_URL']}'>{$row['Publication']}</a><br>\n" ?></td>
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

    <!--table listing all other users-->
    <div class="container">
        <table class="table table-bordered" >
            <thead>
                <tr class="table-dark">
                    <th scope="col">User Name</th>
                    <th scope="col">Verified</th>
                    <th scope="col">Rating</th>
                </tr>
                <?php 
                $connection = mysqli_connect(DBHOST, DBUSER, DBPASS, DBNAME); 
                if (mysqli_connect_errno()) { 
                    echo failure;
                    die(mysqli_connect_error());   
                } 
                $sql = "SELECT Id, user.Name_Display, Is_Verified, User_Rating
                        FROM user
                        WHERE Publication IS NULL";
                if ($result = mysqli_query($connection, $sql)) { 
                    // loop through the data 
                    while($row = mysqli_fetch_assoc($result)) {
                ?>
                        <th scope="row"><?php echo "<a href='user_details.php?Id={$row['Id']}'>{$row['Name_Display']}</a><br>\n" ?></th>
                            <td><?php echo $row['Is_Verified']?></td>
                            <td><?php echo $row['User_Rating'] ?></td>
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