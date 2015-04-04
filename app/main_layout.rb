class MainLayout
  def wrap body_content
%^<!DOCTYPE html>
<html>
  <head>
    <title>Spacefrog Web</title>
    <style type="text/css">
      * {
        margin: 0;
        padding: 0;
        font-size: 14px;
        font-family: Verdana, sans-serif;
      }

      html {
        width: 350px;

      }

      body {
        padding: 12px;
        background-color: #111;
        color: #ccc;
        width: 350px;
      }

      input, textarea {

        box-shadow: inset 1px 1px 5px rgba(0,0,0,0.5);
      }

      input, select, textarea {
        padding: 3px;
        border-radius: 5px;
        border: 1px solid #80f;
        color: #000;
      }

      select {
        display: 'block';
      }

      p {
        margin-top: 3px;
        padding:
      }

      label, h1 {
        min-width: 100px;
        font-size: 14px;
        font-family: Verdana, sans-serif;
        margin-bottom: 8px;
        margin-top: 16px;
        display: block;
        color: #0a0;
      }

      div {
        margin-top: 10px;
        margin-bottom: 10px;
      }

      span.label-column {
        width: 100px;
        font-size: 12px;
        display: inline-block;
        vertical-align: top;
        text-align: right;
        margin-right: 10px;
        color: #f82;
      }

      p textarea {
        display: inline-block;
        vertical-align: top;
      }

      #preview {
        display: none;
        position: fixed;
        top: 2%
        bottom: 2%;
        left: 5%;
        right: 5%;
        width: 90%;
        height: 90%;
        background-color: #f0f0f0;
        border: 1px solid #eee;
        box-shadow: 0 0 10px rgba(0,0,0,0.8);
        z-index: 9999;
        color: #222;
        overflow-y: scroll;
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
        color: #aaa;
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

      @media only screen and (max-device-width: 480px) {
        html {
          width: 350px;
        }
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
