class MainLayout
  def wrap body_content
%^<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Spacefrog Web</title>
    <style type="text/css">
      * {
        margin: 0;
        padding: 0;
        font-size: 13px;
        font-family: Verdana, sans-serif;
        box-sizing: border-box;
        /*max-width: 320px;*/
      }

      body {
        background-color: #111;
        color: #ccc;
      }

      input, textarea {
        box-shadow: inset 0.1em 0.1em 0.4em rgba(0,0,0,0.5);
      }

      input, select, textarea {
        padding: 0.4em;
        border-radius: 0.4em;
        border: 1px solid #80f;
        color: #000;
      }

      input, select {
        height: 2em;
      }

      .grid input, .grid select, .grid textarea {
        width: 220px;
      }

      p {
        margin-top: 0.5em;
      }

      label, h1 {
        min-width: 100px;
        font-size: 1.1em;
        font-family: Verdana, sans-serif;
        margin-bottom: 8px;
        margin-top: 16px;
        display: block;
        color: #0a0;
      }

      #form-wrapper > div {
        padding: 10px;
        border-bottom: 1px solid #305;
      }

      #form-wrapper > div:nth-child(odd) {
        background-color: #103;
      }

      span.label-column {
        width: 60px;
        font-size: 12px;
        display: inline-block;
        vertical-align: middle;
        text-align: right;
        margin-right: 10px;
        color: #f82;
      }

      p textarea {
        display: inline-block;
        vertical-align: top;
      }

      #name-prefix {
        width: 25%;
      }

      #first-name {
        width: 30%;
      }

      #last-name {
        width: 40%;
      }

      #address-1, #address-2 {
        width: 95%;
      }

      #city {
        width: 75%;
      }

      #zip-code {
        width: 20%;
      }

      #preview {
        display: none;
        background-color: #f0f0f0;
        border: 1px solid #eee;
        color: #222;
      }

      #preview-content {
        border: 1px solid #c0c0c0;
        border-radius: 4px;
        background-color: #f8f8f8;
        font-size: 11px;
        margin: 10px;
        padding: 10px;
      }

      #preview-content * {
        font-size: inherit;
      }

      p.close-x {
        text-align: right;
      }

      p.close-x span:after {
        content: "x";
        color: #ddd;
        background-color:#d44;
        padding: 0.2em;
        margin-right: 10px;
        cursor: pointer;
        font-size: 24px;
      }

      .center {
        text-align: center;
        margin-left: auto;
        margin-right: auto;
      }

      button {
        border: 2px solid #f82;
        border-radius: 4px;
        padding: 5px;
        background-color: #111;
        color: #fff;
        cursor: pointer;
      }

      button:hover {
        background-color: #222;
        border-color: #fa4;
      }

      #success {
        font-size: 16px;
        color: #f82;
        display: none;
      }
    </style>
  </head>
  <body>
    #{body_content}
  </body>
</html>
^
  end
end
