enum Routes {
  login("/login"),
  objects("/signin");
  // sets("/sets"),
  // profile("/profile");

  const Routes(this.name);

  final String name;

  @override
  String toString() => name;
}

enum NamedRoutes {
  login("/login"),
  objects("/signin");
  // objects("/objects"),
  // sets("/sets"),

  const NamedRoutes(this.name);

  final String name;

  @override
  String toString() => name;
}
