<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="ui"     uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>TEST PAGE</title>
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


	<script type="text/javascript">
	$('#kt_docs_jstree_basic').jstree({
	    "core" : {
	        "themes" : {
	            "responsive": false
	        }
	    },
	    "types" : {
	        "default" : {
	            "icon" : "fa fa-folder"
	        },
	        "file" : {
	            "icon" : "fa fa-file"
	        }
	    },
	    "plugins": ["types"]
	});
	</script>
	
	<script type="text/javascript" defer>
	$(function() {
		
	const date = new Date();
	console.log("date : "+date);
	let year = date.getFullYear();
	let month = date.getMonth() + 1;
	let day = date.getDate();
	let hour = date.getHours();
	let minute = date.getMinutes();
	let second = date.getSeconds();
	const today = year + "-" + month + "-" + day + " " + hour + ":" + minute + ":" + second
	console.log("YYYY-MM-DD HH24:MI:SS : "+ today);
	
	$("body h1").append(" : " + today);
	})
	</script>
</head>

<body>
<h1>Page 실행시간</h1>
<div id="kt_docs_jstree_basic">
    <ul>
        <li>
            Root node 1
            <ul>
                <li data-jstree='{ "selected" : true }'>
                    <a href="javascript:;">
                        Initially selected </a>
                </li>
                <li data-jstree='{ "icon" : "flaticon2-gear text-success " }'>
                    custom icon URL
                </li>
                <li data-jstree='{ "opened" : true }'>
                    initially open
                    <ul>
                        <li data-jstree='{ "disabled" : true }'>
                            Disabled Node
                        </li>
                        <li data-jstree='{ "type" : "file" }'>
                            Another node
                        </li>
                    </ul>
                </li>
                <li data-jstree='{ "icon" : "flaticon2-rectangular text-danger" }'>
                    Custom icon class (bootstrap)
                </li>
            </ul>
        </li>
        <li data-jstree='{ "type" : "file" }'>
            <a href="http://www.keenthemes.com">
                Clickable link node </a>
        </li>
    </ul>
</div>
</body>
</html>
