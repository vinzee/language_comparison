lazy val root = (project in file(".")).
  aggregate(app).
  settings(inThisBuild(List(
      organization := "com.example",
      scalaVersion := "2.11.8"
    )),
    name := "json_parser-root"
  )

lazy val app = (project in file("app")).
  settings(
    name := "json_parser"
  )
libraryDependencies += "com.google.code.gson" % "gson" % "2.8.0"
