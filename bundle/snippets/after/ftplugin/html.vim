" vim: filetype=html
ParseThisSnippetFile
finish

:snippet h1
<h1><@></h1>

:snippet h2
<h2><@></h2>

:snippet h3
<h3><@></h3>

:snippet a
<a href="<@>"></a>

:snippet img
<img src="<@>" alt="" />

:snippet script
<script type="text/javascript" src="<@>"></script>

:snippet css CSS <link ... />
<link rel="stylesheet" type="text/css" href="<@>" />

:snippet select
<select>
  <option value="volvo">Volvo</option>
  <option value="audi">Audi</option>
</select>

:snippet ol
<ol>
    <li>one</li>
    <li>two</li>
    <li>three</li>
</ol>

:snippet ul
<ul>
    <li>one</li>
    <li>two</li>
    <li>three</li>
</ul>

:snippet table
<table>
    <tr>
        <th>First</th>
        <th>Last</th>
        <th>Points</th>
    </tr>
    <tr>
        <td>Jill</td>
        <td>Smith</td>
        <td>50</td>
    </tr>
    <tr>
        <td>Eve</td>
        <td>Jackson</td>
        <td>94</td>
    </tr>
</table>

:alias html5 html

:snippet html HTML5 Template
<!doctype html>
<html lang="en">
<head>
    <meta charset="utf-8" />
    <title><@></title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
</body>
</html>
