<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html>
<head>
<title>TEST PAGE</title>

<style>
body {
  background-color: lightblue;
}

.test {
	height: 150px;
    background: green;
    perspective:500px;
    }
.test_1 {
	position: absolute;
    left: 50%;
	height: 100px;
    width: 100px;
    background: red;
    transform: rotateY(0deg) translateZ(-50px);
   }

.test1 {
	height: 150px;
    background: blue;
    perspective:500px;
    }
.test1_1 {
	position: absolute;
    left: 50%;
	height: 100px;
    width: 100px;
    background: red;
    transform: rotateY(45deg) translateZ(50px);
   }
    
.test2 {
	height: 150px;
    background: yellow;
    perspective:500px;
    }
    
.test2_1 {
	position: absolute;
    left: 50%;
	height: 100px;
    width: 100px;
    background: black;
    transform: rotateY(45deg) translateZ(-50px);
    }

.test3 {
	height: 150px;
    background: blue;
    perspective:800px;
    }
.test3_1 {
	position: absolute;
    left: 50%;
	height: 100px;
    width: 100px;
    background: red;
    transform: rotateY(-45deg) translateZ(50px);
   }
    
.test4 {
	height: 150px;
    background: yellow;
    perspective:800px;
    }
    
.test4_1 {
	position: absolute;
    left: 50%;
	height: 100px;
    width: 100px;
    background: black;
    transform: rotateY(-45deg) translateZ(-50px);
    }
</style>


</head>

<body>
	<h1>This is TEST PAGE</h1>
	
<div class="test">
	<li class="test_1"></li>
</div>

<div class="test1">
	<li class="test1_1"></li>
    </div>

<div class="test2">
	<li class="test2_1"></li>
    </div>

<div class="test3">
	<li class="test3_1"></li>
    </div>

<div class="test4">
	<li class="test4_1"></li>
    </div>

</body>
</html>
