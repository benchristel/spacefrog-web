class MainLayout
  def wrap body_content
%^<!DOCTYPE html>
<html>
  <head>
    <title>Spacefrog Web</title>
  </head>
  <body>
    #{body_content}
  </body>
</html>
^
  end
end
