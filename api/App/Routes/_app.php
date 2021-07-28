<?php

/**@var Leaf\App $app */

$app->get("/", function () {
    json(["message" => "Congrats!! You're on Leaf API"], 200);
});

