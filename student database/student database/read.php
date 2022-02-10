<?php

/**
 * Function to query information based on 
 * a parameter: in this case, Last Name.
 *
 */

if (isset($_POST['submit'])) {
    try {    
        require "config.php";
        require "common.php";

        $connection = new PDO($dsn, $username, $password, $options);

        $sql = "SELECT * 
                        FROM Student
                        WHERE Last Name = :lastname";

        $lastname = $_POST['lastname'];

        $statement = $connection->prepare($sql);
        $statement->bindParam(':lastname', $lastname, PDO::PARAM_STR);
        $statement->execute();

        $result = $statement->fetchAll();
    } catch(PDOException $error) {
        echo $sql . "<br>" . $error->getMessage();
    }
}
?>
<?php include "templates/header.php"; ?>
<?php  
if (isset($_POST['submit'])) {
    if ($result && $statement->rowCount() > 0) { ?>
        <h2>Results</h2>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th> 
                    <th>Address</th>
					<th>Phone</th>
                    <th>Student Email</th>
                    <th>Personal Email</th>
                    <th>Interest</th>
                    <th>Active</th>
                    <th>ITS 108 Query</th>
                    <th>Program</th>
                </tr>
            </thead>
            <tbody>
    <?php foreach ($result as $row) { ?>
            <tr>
                <td><?php echo escape($row["idStudent"]); ?></td>
                <td><?php echo escape($row["First Name"]); ?></td>
                <td><?php echo escape($row["Last Name"]); ?></td>
                <td><?php echo escape($row["Address"]); ?></td>
                <td><?php echo escape($row["Phone"]); ?></td>
                <td><?php echo escape($row["student email"]); ?></td>
                <td><?php echo escape($row["personal email"]); ?></td>
                <td><?php echo escape($row["email"]); ?></td>
                <td><?php echo escape($row["interest"]); ?></td>
                <td><?php echo escape($row["active"]); ?> </td>
				<td><?php echo escape($row["its108query"]); ?> </td>
				<td><?php echo escape($row["program"]); ?> </td>
            </tr>
        <?php } ?> 
            </tbody>
    </table>
    <?php } else { ?>
        <blockquote>No results found for <?php echo escape($_POST['lastname']); ?>.</blockquote>
    <?php } 
} ?> 
<h2>Find user based on Last Name</h2>
<form method="post">

<label for="lastname">Last Name</label>

<input type="text" name="lastname" id="lastname">

<input type="submit" name="submit" value="Submit">

</form>
<a href="index.php">Back to home</a>
<?php include "templates/footer.php"; ?>

