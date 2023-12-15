enum Routes {
  root("/root"),
  login("/login"),
  registration("/registration"),
  city("/city"),
  objects("/signin");
  // sets("/sets"),
  // profile("/profile");

  const Routes(this.name);

  final String name;

  @override
  String toString() => name;
}

enum NamedRoutes {
  root("/root"),
  login("/login"),
  registration("/registration"),
  city("/city"),
  objects("/signin");
  // objects("/objects"),
  // sets("/sets"),

  const NamedRoutes(this.name);

  final String name;

  @override
  String toString() => name;
}
