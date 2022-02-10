<?php

/**
 * Use an HTML form to create a new entry in the
 * users table.
 *
 */


if (isset($_POST['submit'])) {
    require "config.php";
    require "common.php";

    try {
        $connection = new PDO($dsn, $username, $password, $options);
        
        $new_user = array(
            "firstname" => $_POST['firstname'],
            "lastname"  => $_POST['lastname'],           
            "address"  => $_POST['address'],
            "city"  => $_POST['city'],
           "state"  => $_POST['state'],
           "zip"  => $_POST['zip'],
            "email"     => $_POST['email'],
            "age"       => $_POST['age']
            
        );

        $sql = sprintf(
                "INSERT INTO %s (%s) values (%s)",
                "people",
                implode(", ", array_keys($new_user)),
                ":" . implode(", :", array_keys($new_user))
        );
        
        $statement = $connection->prepare($sql);
        $statement->execute($new_user);
    } catch(PDOException $error) {
        echo $sql . "<br>" . $error->getMessage();
    }
    
}
?>
<?php include "templates/header.php"; ?>
<h2>Add a User</h2>
<?php if (isset($_POST['submit']) && $statement) { ?>
    <blockquote><?php echo $_POST['firstname']; ?> successfully added.</blockquote>
<?php } ?>
<form method="post">

<label for="firstname">First Name</label>

<input type="text" name="firstname" id="firstname">

<label for="lastname">Last Name</label>

<input type="text" name="lastname" id="lastname">

<label for="address">Address</label>

<input type="text" name="address" id="address">

<label for="city">City</label>

<input type="text" name="city" id="city">

<label for="state">State</label>

<input type="text" name="state" id="state">

<label for="zip">Zip Code</label>

<input type="text" name="zip" id="zip">

<label for="email">Email Address</label>

<input type="text" name="email" id="email">

<label for="age">Age</label>

<input type="text" name="age" id="age">

<input type="submit" name="submit" value="Submit">

</form>
<a href="index.php">Back to home</a>
<?php include "templates/footer.php"; ?>