<%@ page contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="ui" uri="http://egovframework.gov/ctl/ui"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang="ko" xml:lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>TEST PAGE</title>

	<style>
	html { margin:0; padding:0; font-size:62.5%; }
	body { max-width:800px; min-width:300px; margin:0 auto; padding:20px 10px; font-size:14px; font-size:1.4em; }
	h1 { font-size:1.8em; }
	.demo { overflow:auto; border:1px solid silver; min-height:100px; }
	</style>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<!-- 
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script> -->

</head>

<body>
	<h1>HTML demo</h1>
	<div id="html" class="demo">
		<ul>
			<li data-jstree='{ "opened" : true }'>Root node
				<ul>
					<li data-jstree='{ "selected" : true }'>Child node 1</li>
					<li>Child node 2</li>
				</ul>
			</li>
		</ul>
	</div>

	<h1>Inline data demo</h1>
	<div id="data" class="demo"></div>

	<h1>Data format demo</h1>
	<div id="frmt" class="demo"></div>

	<h1>AJAX demo</h1>
	<div id="ajax" class="demo"></div>

	<h1>Lazy loading demo</h1>
	<div>
		<button onclick="exCreate();" class="btn btn-primary">create</button>
		<button onclick="exRename();" class="btn btn-warning">rename</button>
		<button onclick="exDelete();" class="btn btn-danger">delete</button>
	</div>
	<div id="lazy" class="demo"></div>

	<h1>Callback function data demo</h1>
	<div id="clbk" class="demo"></div>

	<h1>Interaction and events demo</h1>
	<button id="evts_button">select node with id 1</button> <em>either click the button or a node in the tree</em>
	<div id="evts" class="demo"></div>

	<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="./../../dist/jstree.min.js"></script> -->
	
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
	
	<script>
	// html demo
	$('#html').jstree();

	// inline data demo
	$('#data').jstree({
		'core' : {
			'data' : [
				{ "text" : "Root node", "children" : [
						{ "text" : "Child node 1" },
						{ "text" : "Child node 2" }
				]}
			]
		}
	});

	// data format demo
	$('#frmt').jstree({
		'core' : {
			'data' : [
				{
					"text" : "Root node",
					"state" : { "opened" : true },
					"children" : [
						{
							"text" : "Child node 1",
							"state" : { "selected" : true },
							"icon" : "jstree-file"
						},
						{ "text" : "Child node 2", "state" : { "disabled" : true } }
					]
				}
			]
		}
	});

	// ajax demo
	$('#ajax').jstree({
		'core' : {
			'data' : {
				"url" : "localhost:8080/rootJson.do",
				"dataType" : "json" // needed only if you do not supply JSON headers
			}
		}
	});

	// lazy demo
	$('#lazy').jstree({
		'core' : {
			'data' : {
				"url" : "//www.jstree.com/fiddle/?lazy",
				"data" : function (node) {
					return { "id" : node.id };
				}
			}
		}
	}).on("changed.jstree", function (e, data) {
		console.log("data.selected : "+data.selected);
		if(data.selected.length) {
			console.log("lazy 열림");
		}
		if(e.type == "changed") {
			console.log("e.type : "+e.type);
		}
	}).on("dblclick.jstree", function(data) {
		console.log("double click");
		return false;
	});

	// data from callback
	$('#clbk').jstree({
		'core' : {
			'data' : function (node, cb) {
				if(node.id === "#") {
					cb([{"text" : "Root", "id" : "1", "children" : true}]);
				}
				else {
					cb(["Child"]);
				}
			}
		}
	});

	// interaction and events
	$('#evts_button').on("click", function () {
		var instance = $('#evts').jstree(true);
		instance.deselect_all();
		instance.select_node('1');
	});
	$('#evts')
		.jstree({
			'core' : {
				'multiple' : false,
				'data' : [
					{ "text" : "Root node", "children" : [
							{ "text" : "Child node 1", "id" : 1 },
							{ "text" : "Child node 2" }
					]}
				]
			}
		})
		.on("changed.jstree", function (e, data) {
			if(data.selected.length) {
				alert('The selected node is: ' + data.instance.get_node(data.selected[0]).text);
			}
		})
		/* .on("click.jstree", function(data) {
			alert("sss");
		}); */
	</script>
	
	<script type="text/javascript">
	function exCreate() {
		alert("exCreate");
		var ref = $('#lazy').jstree(true),
		sel = ref.get_selected();
			    
		if (!sel.length) {
			return false;
		}
			    
		sel = sel[0];
			    
		sel = ref.create_node(sel, {
			"type": "file"
		});
			    		    

		ref.edit(sel);		    		  	
	};
	
	function exRename() {
		var ref = $('#lazy').jstree(true),
		sel = ref.get_selected();
			    
		if (!sel.length) {
			return false;
		}
		sel = sel[0];
			    
		ref.edit(sel);
	};
	
	function exDelete() {
		var ref = $('#lazy').jstree(true),
		sel = ref.get_selected();
			   
		if (!sel.length) {
			return false;
		}
			    
		ref.delete_node(sel);
	};
	</script>
</body>
</html>
