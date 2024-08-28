<!DOCTYPE html>
<html>
    <head>
        <script>
            function loadDoc() {
                var xhttp = new XMLHttpRequest();
                var name = document.getElementById('myname').value;
                xhttp.onreadystatechange = function() {
                    if (this.readyState == 4 && this.status == 200) {
                        document.getElementById("demo").innerHTML = this.responseText;
                    }
                };
                xhttp.open("POST", "/ajax2.jsp?id="+name, true);
                xhttp.send();
            }
        </script>
    </head>
<body>

<div id="demo">
  <h2>Let AJAX change this text</h2>
  <input type="text" id="myname" placeholder="Enter your name"><br>
  <button type="button" onclick="loadDoc()">Change Content</button>
</div>

</body>
</html>