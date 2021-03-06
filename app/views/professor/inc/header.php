<?php $id = $_SESSION['user_data']['id']; ?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
    <link rel="stylesheet" href="../../public/css/style.css">     
    <script  type="text/javascript" src="../../../public/js/jquery-3.4.1.js"></script>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-3 fixed-top">
        <button class="navbar-toggler" type="button" 
                data-toggle="collapse" 
                data-target="#navbarsExampleDefault" 
                aria-controls="navbarsExampleDefault" 
                aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarsExampleDefault">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="/mystudents/<?= $id; ?>">My Students</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/studentgroups/<?= $id; ?>">Student Groups</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/schedule/<?= $id; ?>">Schedules</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/certificates/<?= $id; ?>">Certificates</a>
                </li>
            </ul>
            <ul class="navbar-nav ml-auto">
                <li class="nav-item">
                    <a class="btn btn-success btn-block" href="/logout">Logout</a>
                </li>
            </ul>
        </div>
    </nav>
        
