<?php

require "connection.php";


if (isset($_POST["register"])) {
    $name = $_POST["name"];
    $username = $_POST["username"];
    $password = $_POST["password"];
    $encrypt_password = md5($password);

    // Check if the name is valid
    if (strlen($name) <= 1 || preg_match('/([b-df-hj-np-tv-z])\1{1,}/i', $name) || preg_match('/(.)\1{3,}/i', $name)) {
        $error = "Invalid name. Please provide a valid name.";
    } else {
        // Check if the user exists
        $sql_check = "SELECT * FROM users WHERE username = '$username'";
        $query_check = mysqli_query($connection, $sql_check);
        if (mysqli_fetch_assoc($query_check)) {
            // User already exists
            $error = "User already exists";
        } else {
            // Insert into the DB
            $sql = "INSERT INTO users (name, username, password) 
               VALUES ('$name', '$username', '$encrypt_password')";
            $query = mysqli_query($connection, $sql) or die("Can't save data");
            $success = "Registration successful";
        }
    }
}



if (isset($_POST["login"])) {

    $username = $_POST["username"];
    $password = $_POST["password"];
    $encrypt_password = md5($password);

    //check if user exist
    $sql_check2 = "SELECT * FROM users WHERE username = '$username'";
    $query_check2 = mysqli_query($connection, $sql_check2);
    if (mysqli_fetch_assoc($query_check2)) {
        //check if username and password exist
        $sql_check = "SELECT * FROM users WHERE username = '$username' AND password = '$encrypt_password'";
        $query_check = mysqli_query($connection, $sql_check);
        if ($result = mysqli_fetch_assoc($query_check)) {
            //Login to dashboard
            $_SESSION["user"] = $result;
            if ($result["role"] == "user") {
                if (isset($_SESSION["url"])) {
                    $recipe_id = $_SESSION["url"];
                    header("location: read-recipe.php?recipe_id=$recipe_id");
                } else {
                    header("location: new-recipe.php");
                }
            } else {
                header("location: dashboard.php");
            }
            $success = "User logged in";
        } else {
            //user password wrong
            $error = "User password wrong";
        }
    } else {
        //user not found
        $error = "Wrong Username";
    }
}


if (isset($_POST["new_recipe"])) {
    //uploading to upload folder
    $target_dir = "uploads/";
    $basename = basename($_FILES["thumbnail"]["name"]);
    $upload_file = $target_dir . $basename;
    //move uploaded file
    $move = move_uploaded_file($_FILES["thumbnail"]["tmp_name"], $upload_file);
    if ($move) {
        $url = $upload_file;
        $title = $_POST["title"];
        $ingredient = $_POST["ingredient"];
        $cook_time = $_POST["cook_time"];
        $direction = $_POST["direction"];
        $yield = $_POST["yield"];
        $category_id = $_POST["category_id"];
        $image = $url;
        //sql
        $sql = "INSERT INTO recipes(title,ingredient,direction,cook_time,yield,category_id,image) VALUES
                ('$title','$ingredient','$direction','$cook_time','$yield','$category_id','$image')";
        $query = mysqli_query($connection, $sql);
        if ($query) {
            //success message
            $success = "New Recipe added";
        } else {
            $error = "Unable to add new recipe";
        }
    } else {
        $error = "Unable to upload image";
    }
}

if (isset($_POST["update_recipe"])) {
    $id = $_GET["edit_recipe_id"];
    if ($_FILES["thumbnail"]["name"] != "") {
        //upload image
        $target_dir = "uploads/";
        $url = $target_dir . basename($_FILES["thumbnail"]["name"]);
        //move uploaded file
        if (move_uploaded_file($_FILES["thumbnail"]["tmp_name"], $url)) {
            //update to database
            //parameters 
            $title = $_POST["title"];
            $ingredient = $_POST["ingredient"];
            $cook_time = $_POST["cook_time"];
            $direction = $_POST["direction"];
            $yield = $_POST["yield"];
            $category_id = $_POST["category_id"];
            $image = $url;
            //sql
            $sql = "UPDATE recipes SET title ='$title', ingredient='$ingredient', 
                    cook_time='$cook_time',direction='$direction',yield='$yield', 
                    category_id='$category_id', image='$image' WHERE id='$id' ";
            $query = mysqli_query($connection, $sql);
            //check if
            if ($query) {
                $success = "Recipe updated";
            } else {
                $error = "Unable to update recipe";
            }
        }
    } else {
        //leave the upload image and
        //update to database
        //parameters 
        $title = $_POST["title"];
        $ingredient = $_POST["ingredient"];
        $cook_time = $_POST["cook_time"];
        $direction = $_POST["direction"];
        $yield = $_POST["yield"];
        $category_id = $_POST["category_id"];
        //sql
        $sql = "UPDATE recipes SET title ='$title', ingredient='$ingredient', 
            cook_time='$cook_time',direction='$direction',yield='$yield', 
            category_id='$category_id' WHERE id='$id' ";
        $query = mysqli_query($connection, $sql);
        //check if
        if ($query) {
            $success = "recipe updated";
        } else {
            $error = "Unable to update recipe";
        }
    }
}

if (isset($_GET["delete_recipe"]) && !empty($_GET["delete_recipe"])) {
    $id = $_GET["delete_recipe"];
    //sql
    $sql = "DELETE FROM recipes WHERE id = '$id'";
    $query = mysqli_query($connection, $sql);
    //check if
    if ($query) {
        $success = "recipe deleted successfully";
    } else {
        $error = "Unable to delete recipe";
    }
}


if (isset($_POST["comment_new"])) {
    $comment = $_POST["comment"];
    $user_id = $_SESSION["user"]["id"];
    $recipe_id = $_GET["recipe_id"];

    if (empty($_POST["comment"])) {
        $error = "Your comment is required!";
    } else {

        //sql & query
        $sql = "INSERT INTO comments(user_id,message,recipe_id) VALUES('$user_id','$comment','$recipe_id')";
        $query = mysqli_query($connection, $sql);
        //check if
        if ($query) {
            $success = "Comment added successfully";
        } else {
            $error = "Unable to add comment";
        }
    }
}

if (isset($_GET["approve_recipe"]) && !empty($_GET["approve_recipe"])) {
    $recipe_id = $_GET["approve_recipe"];
    //sql query
    $sql = "UPDATE recipes SET status = 1 WHERE id = '$recipe_id'";
    $query = mysqli_query($connection, $sql);
    //check if
    if ($query) {
        $success = "Recipe approved";
    } else {
        $error = "Unable to approved Recipe";
    }
}

